class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :invoice_number
      t.integer :status
      t.date :due_date
      t.datetime :created_date
      t.references :user, null: false, foreign_key: true # user_id as a foreign key
      t.references :job, null: false, foreign_key: true  # job_id as a foreign key
      t.string :client_name
      t.string :client_address
      t.decimal :total, precision: 10, scale: 2 # Adding precision and scale for decimal

      t.timestamps
    end
  end
end
