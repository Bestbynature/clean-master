class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :location
      t.string :title
      t.text :description
      t.string :job_address
      t.string :user_client_id
      t.string :user_client_name
      t.string :user_assignee_id
      t.string :user_assignee_name
      t.integer :job_status

      t.timestamps
    end
  end
end
