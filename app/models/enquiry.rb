class Enquiry < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :job, optional: true # Enquiries can be made without a specific job

  # Validations
  validates :message, presence: true
end
