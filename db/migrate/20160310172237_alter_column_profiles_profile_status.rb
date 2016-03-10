class AlterColumnProfilesProfileStatus < ActiveRecord::Migration
  def self.up
    change_table :profiles do |t|
      t.change :profile_status, :string
    end
  end

  def self.down
    change_table :profiles do |t|
      t.change :profile_status, :boolean
    end
  end
end
