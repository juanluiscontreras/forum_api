class UsersController < ApplicationController
	skip_before_action :authorize_request, only: :create
  # POST /sessions
  # return authenticated token upon sessions
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.username, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  private

  def user_params
    params.permit(
      :username,
      :password,
      :password_confirmation,
      :screen_name,
      :email
    )
  end
end
