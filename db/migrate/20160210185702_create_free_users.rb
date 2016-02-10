class CreateFreeUsers < ActiveRecord::Migration
  def change
    create_table :free_users do |t|
      t.integer :user_id,        null: false
      t.integer :sku,            null: false

      t.timestamps null: false
    end
  end
end
