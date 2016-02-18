class RemoveFrontpageFromStories < ActiveRecord::Migration
  def change
    remove_column :stories, :frontpage, :string
  end
end
