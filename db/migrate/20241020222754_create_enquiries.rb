class CreateEnquiries < ActiveRecord::Migration[7.0]
  def change
    create_table :enquiries do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :post_code
      t.text :message_description

      t.timestamps
    end
  end
end
