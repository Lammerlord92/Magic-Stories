class AddFollowersCountToProfile < ActiveRecord::Migration
  def change
  add_column :profiles, :followers_count, :integer, :default => 0
  end
end
