class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.find_by(name:'sunajiu')
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
  end

  def sign_in
    name = params[:name]
    password = params[:password]
    session.clear
    if User.exists?(name:name, password:password)
      session[:login] = true
      session[:user] = name
      # redirect_to @user
    end
  end
  private
    def user_params
      params.require(:user).permit(:name, :password, :email)
    end
end
