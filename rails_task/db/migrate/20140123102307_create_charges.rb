class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :currency
      t.decimal :amount, :precision => 8, :scale => 2
      t.boolean :paid
      t.boolean :refunded
      t.integer :customer_id

      t.timestamps
    end
  end
end
