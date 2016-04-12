class Payment < ActiveRecord::Base
  validates :token, uniqueness: true
  validates :amount, presence: true
  validates :identifier, uniqueness: true
  belongs_to :good, polymorphic: true

  # En este caso siempre va a ser digital, instant y por pop-up (lo contario a recurring), quiere decir
  # no hay shipping ni se va a cobrar mensualmente (no subscripciones). Además vamos a hacer que salte
  # la ventana como pop-up. Dejo esto por si en un futuro se barajaran esas vias
  scope :story, ->  (recurring) { where(good_type: 'Story') }
  scope :premium, ->  (recurring) { where(good_type: 'MembershipCard') }
  scope :donation, ->  (recurring) { where(good_type: 'Donation') }

  scope :recurring, ->  (recurring) { where(recurring: true) }
  scope :digital,  -> (digital) { where(digital: true) }
  scope :popup,   ->  (popup) { where(popup: true) }

  # Esos métodos como ya he dicho antes van a dar digital/instant/popup
  def goods_type
    digital? ? :digital : :real
  end

  def payment_type
    recurring? ? :recurring : :instant
  end

  def ux_type
    popup? ? :popup : :redirect
  end

  def details
    # Usamos solo el else
    if recurring?
      client.subscription(self.identifier)
    else
      client.details(self.token)
    end
  end

  attr_reader :redirect_uri, :popup_uri
  def setup!(return_url, cancel_url)
    response = client.setup(
      payment_request,
      return_url,
      cancel_url,
      pay_on_paypal: true,
      no_shipping: true
    )
    self.token = response.token
    self.save!
    @redirect_uri = response.redirect_uri
    @popup_uri = response.popup_uri
    self
  end

  def cancel!
    self.canceled = true
    self.save!
    self
  end

  def complete!(payer_id = nil)
    #Usamos solo el else
    if self.recurring?
      response = client.subscribe!(self.token, recurring_request)
      self.identifier = response.recurring.identifier
    else
      response = client.checkout!(self.token, payer_id, payment_request)
      self.payer_id = payer_id
      self.identifier = response.payment_info.first.transaction_id
    end
    self.completed = true
    self.save!
    self
  end

  # Este metodo no lo usamos
  def unsubscribe!
    client.renew!(self.identifier, :Cancel)
    self.cancel!
  end

  private

  def client
    Paypal::Express::Request.new PAYPAL_CONFIG
  end

  def payment_request
    if(self.good_type == 'Story')
      payment_request_story
    elsif(self.good_type == 'MembershipCard')
      if(self.good.message ==! 'VITALICIOSUPERJUANOIDESURRENDERAT20')
        payment_request_membership_card
      else
        payment_request_vitalicio_super_juanoide_surrender_at_20
      end
    else
    # Esto es la donación
    payment_request_donation
    end

  end


  def payment_request_story
    Paypal::Payment::Request.new(
  :currency_code => :EUR, # if nil, PayPal use USD as default
  :amount        => self.good.price,
  :items => [{
    :name => self.good.title,
    :description => self.good.description,
    :amount => self.good.price,
    :category => :Digital
  }]
)
  end



  # Se deja para cuando salgamos de la beta y se compre el premium por meses
  def payment_request_membership_card
    Paypal::Payment::Request.new(
  :currency_code => :EUR, # if nil, PayPal use USD as default
  :amount        => self.good.premiumMonths * 5.95,
  :items => [{
    :name => 'Cuenta premium por ' + self.good.premiumMonths + 'meses.',
    :description => 'Disfruta de todas las funcionalidades',
    :amount => self.good.premiumMonths * 5.95,
    :category => :Digital
  }]
)
  end

  def payment_request_vitalicio_super_juanoide_surrender_at_20
    Paypal::Payment::Request.new(
  :currency_code => :EUR, # if nil, PayPal use USD as default
  :amount        => 10.0,
  :items => [{
    :name => 'Cuenta premium para siempre',
    :description => 'Disfruta de todas las funcionalidades durante 100 años',
    :amount => 10.0,
    :category => :Digital
  }]
)
  end

  def payment_request_donation
    Paypal::Payment::Request.new(
  :currency_code => :EUR, # if nil, PayPal use USD as default
  :amount        => self.good.amount,
  :items => [{
    :name => 'Gracias por su donación',
    :description => 'Gracias a ti el equipo de desarrollo puede seguir trabajando para mejorar estos servicios.',
    :amount => self.good.amount,
    :category => :Digital
    }]
    )
  end





  def recurring_request
    Paypal::Payment::Recurring.new(
      start_date: Time.now,
      description: 'Never will ocurr',
      billing: {
        period: :Month,
        frequency: 1,
        amount: self.amount
      }
    )
  end
end
