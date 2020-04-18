class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    render "users/new"
  end

  def create
    new_user = User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )

    redirect_to root_path
  end

  def login
    email = params[:email]
    password = params[:password]
    response_text = "False"
    if (User.exists?(:email => email, :password => password))
      response_text = "True"
    end

    render plain: response_text
  end
end
