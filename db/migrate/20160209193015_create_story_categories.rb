class CreateStoryCategories < ActiveRecord::Migration
  def change
    create_table :story_categories do |t|
      t.references :stories, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
