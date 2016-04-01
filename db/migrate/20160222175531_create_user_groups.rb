class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.string :name
      t.string :code
      t.integer :discount_user_group_id
      t.integer :actor_user_group_id

      t.timestamps null: false
    end
  end
end
