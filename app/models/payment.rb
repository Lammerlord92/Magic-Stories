class Payment < ActiveRecord::Base
  validates :token, uniqueness: true
  validates :amount, presence: true
  validates :identifier, uniqueness: true
  belongs_to :story

  # En este caso siempre va a ser digital, instant y por pop-up (lo contario a recurring), quiere decir
  # no hay shipping ni se va a cobrar mensualmente (no subscripciones). Además vamos a hacer que salte
  # la ventana como pop-up. Dejo esto por si en un futuro se barajaran esas vias
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
    Paypal::Payment::Request.new(
  :currency_code => :EUR, # if nil, PayPal use USD as default
  :amount        => self.story.price,
  :items => [{
    :name => self.story.title,
    :description => self.story.description,
    :amount => self.story.price,
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
