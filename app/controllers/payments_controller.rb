class PaymentsController < ApplicationController
  rescue_from Paypal::Exception::APIError, with: :paypal_api_error
  def show
    @payment = Payment.find_by_identifier! params[:id]
  end

  def create
    story = Story.find(params[:id])
    payment = Payment.create!({amount: story.price, digital: true, recurring: false, popup: false, story: story})
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
      ## Creando addition
      #
    @addition = Addition.new
    @addition.purchase_date = Date.current
    story = payment.story
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

    end
  end

  def cancel
    handle_callback do |payment|
      payment.cancel!
      flash[:warn] = 'Payment Request Canceled'
      root_url
    end
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

end
