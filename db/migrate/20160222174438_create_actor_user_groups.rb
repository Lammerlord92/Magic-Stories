class CreateActorUserGroups < ActiveRecord::Migration
  def change
    create_table :actor_user_groups do |t|
      t.integer :user_id
      t.integer :usergroup_id

      t.timestamps null: false
    end
  end
end
