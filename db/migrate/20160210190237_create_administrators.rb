class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.integer :user_id,        null: false
      t.integer :sku,            null: false

      t.timestamps null: false
    end
  end
end
