class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.float :amount, default: 0.0
      t.string :token, :identifier, :payer_id
      t.boolean :recurring, :digital, :popup, :completed, :canceled, default: false
      t.integer  "good_id"
      t.string   "good_type"
      t.timestamps
    end
  end
end
