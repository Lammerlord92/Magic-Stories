class NewAddCoverToStories < ActiveRecord::Migration
  def change
    add_column :stories, :cover, :text
  end
end
