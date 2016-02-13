class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_messageable

  # Distinguiendo roles

  belongs_to :role, polymorphic: true

  # Perfil?

  has_one :profile

  # Friendshipping

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user


  validates :username, :name, :surname1, :surname2, :email, :birthday, :sku, presence: true
  validates :username, :email, :sku, uniqueness: true



  def self.validate_olderThan18
    Date.today - :birthday.to_date >= 18.years.to_date # 18 años
  end

  def name
    return :name
  end

  #Returning the email address of the model if an email should be sent for this object (Message or Notification).
  #If no mail has to be sent, return nil.
  def mailboxer_email(object)
    #Check if an email should be sent for that object
    #if true
    #return :email
    #if false
    return nil
  end

end
