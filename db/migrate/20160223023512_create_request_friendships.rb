class CreateRequestFriendships < ActiveRecord::Migration
  def change
    create_table :request_friendships do |t|
      t.integer :sender_id, null: false
      t.integer :recipient_id, null: false
      t.text :message
      t.string :status

      t.timestamps null: false
    end
  end
end
