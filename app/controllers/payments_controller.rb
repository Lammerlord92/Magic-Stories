class PaymentsController < ApplicationController
  rescue_from Paypal::Exception::APIError, with: :paypal_api_error
  def show
    @payment = Payment.find_by_identifier! params[:id]
  end



def create_mc_payment # Membership Card
  message = 'VITALICIOSUPERJUANOIDESURRENDERAT20'
  premiumMonths = 100*12
    # Precio del vitalicio
    membership_card = MembershipCard.create!({message: message, premiumMonths: premiumMonths})
    payment = Payment.create!({amount: 10.0, digital: true, recurring: false, popup: false, good: membership_card, token: generateToken, identifier: generateIdentifier})
    payment.setup!(
      success_payments_url,
      cancel_payments_url
      )
    puts(payment.redirect_uri.to_s)
    if payment.popup?
      redirect_to payment.popup_uri
    else
      redirect_to payment.redirect_uri
    end
  end

  def create_story_payment
    story = Story.find(params[:id])
    payment = Payment.create!({amount: story.price, digital: true, recurring: false, popup: false, good: story, token: generateToken, identifier: generateIdentifier})
    payment.setup!(
      success_payments_url,
      cancel_payments_url
      )
    puts(payment.redirect_uri.to_s)
    if payment.popup?
      redirect_to payment.popup_uri
    else
      redirect_to payment.redirect_uri
    end
  end


  def create_donation_payment
    donation = Donation.new({amount: params[:donation][:amount].to_f, message: params[:donation][:message]})
    payment = Payment.create!({amount: donation.amount, digital: true, recurring: false, popup: false, good: donation, token: generateToken, identifier: generateIdentifier})
    payment.setup!(
      success_payments_url,
      cancel_payments_url
      )
    puts(payment.redirect_uri.to_s)
    if payment.popup?
      redirect_to payment.popup_uri
    else
      redirect_to payment.redirect_uri
    end
  end

  # Esto no lo usamos - Es para subscripiciones
  def destroy
    Payment.find_by_identifier!(params[:id]).unsubscribe!
    redirect_to root_path, notice: 'Recurring Profile Canceled'
  end

  def success
    handle_callback do |payment|
      payment.complete!(params[:PayerID])

      if(payment.good_type == 'Story')
      ## Creando addition
      #
      @addition = Addition.new
      @addition.purchase_date = Date.current
      story = payment.good
      @addition.base_price = story.price
      @addition.discount_id = nil
      profile = Profile.find_by_user_id(current_user.id)
      @addition.profile_id = profile.id
      @addition.story_id = story.id

      if @addition.save

        flash[:notice] = 'Payment Transaction Completed'
        payment_url(payment.identifier)

      else
        cancel
      end
    elsif(payment.good_type == 'MembershipCard')
      @code = 'Proceso de pago completado tu código es: #{payment.good.code[0..3]} - #{payment.good.code[4..7]} - #{payment.good.code[8..11]} - #{payment.good.code[12..15]}'
      payment_url(payment.identifier)
    else
      flash[:notice] = 'Payment Transaction Completed'
      payment_url(payment.identifier)
    end

  end
end

def cancel
  handle_callback do |payment|
    payment.cancel!
    flash[:warn] = 'Payment Request Canceled'
    root_url
  end
end

def donation_form
  @donation = Donation.new
end

private

def handle_callback
  payment = Payment.find_by_token! params[:token]
  @redirect_uri = yield payment
  if payment.popup?
    render :close_flow, layout: false
  else
    redirect_to @redirect_uri
  end
end

def paypal_api_error(e)
  redirect_to root_url, error: e.response.details.collect(&:long_message).join('<br />')
end

def generateToken
  r = SecureRandom.urlsafe_base64(n= 8, false)
  until Payment.find_by_token(r) == nil
    r = SecureRandom.urlsafe_base64(n= 8, false)
  end
  return r
end

def generateIdentifier
  r = SecureRandom.urlsafe_base64(n= 8, false)
  until Payment.find_by_identifier(r) == nil
    r = SecureRandom.urlsafe_base64(n= 8, false)
  end
  return r
end





end
