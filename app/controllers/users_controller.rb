class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:name).map { |user| user.to_pleasant_string }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      name: name,
      email: email,
      password: password,
    )

    response_text = " Hey, you are added as a new user with id#{new_user.id}"
    render plain: response_text
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
