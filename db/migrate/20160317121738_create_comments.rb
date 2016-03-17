class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.string :body
      t.date :date
      t.integer :rating
      t.string :author
      t.references :profile, index: true, foreign_key: true
      t.references :story, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
