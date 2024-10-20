class Invoice < ApplicationRecord
  # Associations
  belongs_to :job
  belongs_to :user # User receiving the invoice

  # Validations
  validates :amount, presence: true
  validates :due_date, presence: true
end
