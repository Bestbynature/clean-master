class User < ApplicationRecord
  # Associations
  has_many :jobs
  has_many :enquiries
  has_many :invoices

  # Additional association for clients and vendors
  has_many :vendor_jobs, class_name: 'Job', foreign_key: 'vendor_id'
  has_many :client_jobs, class_name: 'Job', foreign_key: 'client_id'

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :user_type, presence: true # 'client' or 'vendor'
end
