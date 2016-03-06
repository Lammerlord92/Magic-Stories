class AddStoryIdToChapters < ActiveRecord::Migration
  def change
    #add_reference :chapters, :story, index: true, foreign_key: true
    add_column :chapters, :story_id, :integer
    #add_foreign_key :chapters, :stories
  end
end