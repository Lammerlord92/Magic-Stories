class AddProfileToStories < ActiveRecord::Migration
  def change
    add_column :stories, :profile_id, :integer
  end
end
