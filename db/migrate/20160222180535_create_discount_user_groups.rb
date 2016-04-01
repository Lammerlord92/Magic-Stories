class CreateDiscountUserGroups < ActiveRecord::Migration
  def change
    create_table :discount_user_groups do |t|
      t.integer :user_group_id
      t.integer :discount_id

      t.timestamps null: false
    end
  end
end
