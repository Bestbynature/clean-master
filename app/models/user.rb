class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  
         # Associations
  has_many :jobs
  has_many :enquiries
  has_many :invoices

  # Additional association for clients and vendors
  has_many :vendor_jobs, class_name: 'Job', foreign_key: 'vendor_id'
  has_many :client_jobs, class_name: 'Job', foreign_key: 'client_id'

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true # 'client' or 'vendor'
  validates :first_name, presence: true
  validates :last_name, presence: true
end
