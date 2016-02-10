class CreatePremiumUsers < ActiveRecord::Migration
  def change
    create_table :premium_users do |t|

      t.timestamps null: false

    end
  end
end
