class AlterChapterId < ActiveRecord::Migration
  def self.up
    change_column :chapters, :id, :string
  end

  def self.down
    change_column :chapters, :id, :integer
  end
end
