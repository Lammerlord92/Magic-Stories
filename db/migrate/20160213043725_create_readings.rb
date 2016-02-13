class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.integer :story_id
      t.integer :profile_id

      t.timestamps null: false
    end
  end
end
