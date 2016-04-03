module MembershipCardsHelper

  def upgradeUser(user, membershipCard)
    if(user.role_type == "FreeUser")
      upgradeUserFree(user, membershipCard)
      membershipCard.update!({usage: user})
    elsif(user.role_type == "PremiumUser")
      upgradeUserPremium(user, membershipCard)
      membershipCard.update!({usage: user})
    else
      raise 'Eres Admin... ya puedes hacer de todo'
    end
  end


  def upgradeUserFree(user, membershipCard)
    pA = PremiumUser.create

    PremiumUser.transaction do
      User.transaction do
    # Nuestros meses tienen 30 días para bien o para mal.
    expiration = Date.today + membershipCard.premiumMonths * 30
    pA.update!({expiration: expiration})
    user.role.destroy!
    user.update!({role: pA})
    end
    end
  end


  def upgradeUserPremium(user, membershipCard)
    # Nuestros meses tienen 30 días para bien o para mal.
    expiration = user.role.expiration.to_date + membershipCard.premiumMonths * 30
    user.role.update!({expiration: expiration})
  end
end
