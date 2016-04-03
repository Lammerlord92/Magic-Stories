class MembershipCardsController < ApplicationController
  include MembershipCardsHelper
  before_action :authenticate_user!

  def exchange

    if request.post?
      # Usage nil indica que no está en uso
      code = params[:c1]<<params[:c2]<<params[:c3]<<params[:c4]
      mC = MembershipCard.where({code: code, usage: nil}).last
      if current_user.role_type == "Administrator"
        redirect_to '/membership_cards/exchange', notice: 'Eres Admin... ya puedes hacer de todo'

      else

        if mC
          upgradeUser(current_user, mC)
          redirect_to '/membership_cards/exchange', notice: 'Se ha canjeado con éxito.
          ¡Eres usuario premium hasta el ' << current_user.role.expiration.strftime("%d.%m.%Y") << " !"
        else
          redirect_to '/membership_cards/exchange', alert: 'El código no es válido o ya está en uso'
        end
      end
    end

  end



end
