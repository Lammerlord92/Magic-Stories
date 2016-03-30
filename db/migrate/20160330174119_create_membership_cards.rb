class CreateMembershipCards < ActiveRecord::Migration
  def change
    create_table :membership_cards do |t|
      t.string :code
      t.timestamp :expiration
      t.float :premiumMonths
      t.text :message

      t.timestamps null: false
    end
  end
end
