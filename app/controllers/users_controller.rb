class UsersController < ApplicationController
  # protect_from_forgery :except => :show

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
   
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
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
      # redirect_to action: :show
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :email)
    end
end
