
class UsersController < ApplicationController
  respond_to :html, :json
  include UserInfoHelper
  # before_action :get_current_user

  def show
    user = User.find(params["id"])

    if user
      user = inject_extra_user_props(user)
      render json: user
    else
      redirect_to root_path
    end
  end

  # def edit

  # end

  def login
    p params[:user][:email]
    p "HIT"
    current_user = User.find_by_email(params[:user][:email])
    if current_user.password == params[:user][:password]
      session[:user_id] = current_user.id
      render json: current_user
    else
      status 503
    end
  end

  def current_user
    p "*" * 80
    p session[:user_id]
    p "*" * 80

    current_user = nil

    if session[:user_id]
      current_user = User.find(session[:user_id])
    end


    render json: session.to_json
  end

  def logout
    session[:user_id] = nil

    redirect_to root_path

  end

  # def new

  # end

  def create
    p "*" * 80
    p "This is the users params!"
    p user_params
    p "*" * 80


    user = User.new(user_params)
    user.password = user_params[:password]
    
    if user.save!
      p "This worked!"
      session[:user_id] = user.id
      render json: user
    else
      p "This didn't work!"
      render json: "Noooooo"
    end
  end

  def destroy

  end

  def update

  end


  def user_params
    params.require(:user).require(:user).permit(:first_name, :last_name, :email, :password)
  end
  # def get_current_user
  #   current_user = User.find
  # end

end
