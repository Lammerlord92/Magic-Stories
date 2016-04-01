class AddProfileStatusToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :profile_status, :string
  end
end
