class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.references :user, index: true, foreign_key: true
      t.text :title
      t.text :comment

      t.timestamps null: false
    end
  end
end
