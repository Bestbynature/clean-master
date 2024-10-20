class CreateInvoiceItems < ActiveRecord::Migration[7.0]
  def change
    create_table :invoice_items do |t|
      t.string :title
      t.text :description
      t.string :category_name
      t.string :category_id
      t.decimal :amount
      t.integer :quantity
      t.decimal :total_price

      t.timestamps
    end
  end
end
