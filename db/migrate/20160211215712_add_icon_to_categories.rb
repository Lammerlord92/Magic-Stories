class AddIconToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :icon, :text
  end
end
