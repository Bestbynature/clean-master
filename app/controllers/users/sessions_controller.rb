class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    super do |resource|
      if resource.persisted?
        render json: { user: resource, token: current_token }, status: :created
      end
    end
  end

  private

  def current_token
    request.env['warden-jwt.auth'].token
  end
end
