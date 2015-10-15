class UsersController < ApplicationController
  respond_to :html, :json
  include UserInfoHelper
  # before_action :get_current_user

  def show
    user = User.where(id, parmas[:id])
    user.inject_extra_user_props(user)
    render json: user
  end

  # def edit

  # end

  def login
    p params

    current_user = User.find_by_email(params[:email])
    if current_user.password == params[:password]
      session[:user_id] = current_user.id

      render json: current_user
    else
      status 503
    end
  end

  def current_user
    current_user = nil

    if session[:user_id]
      current_user = User.find(session[:user_id])
    end


    render json: current_user
  end

  def logout

  end

  # def new

  # end

  def create
    user = User.create!(email: params["email"], password: params[:password], first_name: params["first_name"], last_name: params[:last_name])

  end

  def destroy

  end

  def update

  end

  # def get_current_user
  #   current_user = User.find
  # end

end
