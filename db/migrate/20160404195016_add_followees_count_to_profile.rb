class AddFolloweesCountToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :followees_count, :integer, :default => 0
  end
end
