class MembershipCard < ActiveRecord::Base
validates :premiumMonths, presence: true
belongs_to :usage, class_name: "User", foreign_key: "usage"
has_many :payments, as: :good


  def validate_out_of_date
    (:expiration.to_date - Date.today).to_i >= 0 # No está caducado
  end


  def generateCode
    r = SecureRandom.urlsafe_base64(n= 16, false)
    until(MembershipCard.find_by_code(r).eql?(nil))
      r = SecureRandom.urlsafe_base64(n= 16, false)
    end
    r
  end

  before_create{
    self.code = generateCode
    self.expiration =  Date.today + 15
    self.usage =  nil
  }
end
