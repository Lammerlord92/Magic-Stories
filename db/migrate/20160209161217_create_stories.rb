class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :frontpage
      t.string :title
      t.string :description
      t.string :language
      t.float :price
      t.date :release_date
      t.boolean :published
      t.integer :num_purchased

      t.timestamps null: false
    end
  end
end
