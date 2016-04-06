class AddCheckedToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :checked, :boolean, :default => false
    add_column :notifications, :source_id, :integer
    add_column :notifications, :outcome_id, :integer
  end
end
