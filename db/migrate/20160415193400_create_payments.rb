class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.float :amount, default: 0.0
      t.string :token, :identifier, :payer_id
      t.boolean :recurring, :digital, :popup, :completed, :canceled, default: false
      t.references :story, index: true, foreign_key: true
      t.timestamps
    end
  end
end
