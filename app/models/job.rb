class Job < ApplicationRecord
  # Associations
  belongs_to :client, class_name: 'User', foreign_key: 'client_id'
  belongs_to :vendor, class_name: 'User', foreign_key: 'vendor_id'
  has_many :enquiries
  has_one :invoice

  # Validations
  validates :description, presence: true
  validates :status, presence: true # e.g., 'pending', 'completed'
end
