class AddCoverToStories < ActiveRecord::Migration
  def change
    add_attachment :stories,:cover
  end
end
