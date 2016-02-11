class AddIconToCategories < ActiveRecord::Migration
  def change
    add_attachment :categories, :icon
  end
end
