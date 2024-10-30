class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)  
  
    if resource.save
      token = Warden::JWTAuth::UserEncoder.new.call(resource, :user, nil).first
      render json: { user: resource, accessToken: token }, status: :created
    else
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end
  

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :role)
  end
end
