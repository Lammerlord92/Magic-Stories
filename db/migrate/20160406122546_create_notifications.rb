class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :feed_id
      t.string :feed_type

      t.timestamps null: false
    end
  end
end
