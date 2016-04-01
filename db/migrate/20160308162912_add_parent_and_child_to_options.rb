class AddParentAndChildToOptions < ActiveRecord::Migration
  def change
    add_column :options, :parent_id, :integer
    add_column :options, :child_id, :integer
  end
end
