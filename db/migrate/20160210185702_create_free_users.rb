class CreateFreeUsers < ActiveRecord::Migration
  def change
    create_table :free_users do |t|

      t.timestamps null: false
    end
  end
end
