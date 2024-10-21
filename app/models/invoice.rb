class Invoice < ApplicationRecord
  # Associations
  belongs_to :job
  belongs_to :user # User receiving the invoice

  has_many :invoice_items, dependent: :destroy
  accepts_nested_attributes_for :invoice_items, allow_destroy: true

  # Validations
  validates :amount, presence: true
  validates :due_date, presence: true
end
