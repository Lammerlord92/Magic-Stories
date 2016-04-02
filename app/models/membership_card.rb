class MembershipCard < ActiveRecord::Base
validates code, uniqueness: true
validates expiration, presence: true
validate expiration, validate_out_of_date: true
validates premiumMonths, presence: true


  def validate_out_of_date
    (:expiration.to_date - Date.today).to_i >= 0 # No está caducado
  end


  def self.generateCode
    r = SecureRandom.urlsafe_base64(n= 16, false)
    until MembershipCard.find_by_code(r) == nil
      r = SecureRandom.urlsafe_base64(n= 16, false)
    end
    return r
  end

  after_create{
    # La "tarjeta" expira  de la creación
    self.update_attributes!({code: generateCode, expiration: Date.today + 15})
    self.save
  }
end
