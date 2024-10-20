class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :email
      t.string :status
      t.string :address
      t.string :country
      t.string :postal_code
      t.string :company
      t.string :profile_photo_path
      t.string :phone_number
      t.boolean :is_verified
      t.string :specialization
      t.string :qualification
      t.string :role
      t.string :certificates_path

      t.timestamps
    end
  end
end
