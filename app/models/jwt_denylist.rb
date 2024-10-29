class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist

  # This model is just for tracking denied JWT tokens
  validates :jti, presence: true, uniqueness: true
end
