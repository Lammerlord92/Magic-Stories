class AddExpirationToPremiumUser < ActiveRecord::Migration
  def change
    add_column :premium_users, :expiration, :timestamp
  end
end
