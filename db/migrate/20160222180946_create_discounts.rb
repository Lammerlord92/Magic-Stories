class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.string :code
      t.string :title
      t.string :description
      t.float :amount
      t.timestamps :validity
      t.boolean :used

      t.timestamps null: false
    end
  end
end
