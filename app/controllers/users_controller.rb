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
      name = @user.name
      session[:login] = true
      session[:user] = name
      session[:user_id] = User.find_by(name:name).id
      redirect_to @user
    else
      render 'new'
    end
  end

  def validate
    
  end

  def show
    @user = User.find(params[:id])
  end

  def home
    name = params[:name]
    password = params[:password]
    session.clear
    if User.exists?(name:name, password:password)
      session[:login] = true
      session[:user] = name
      session[:user_id] = User.find_by(name:name).id
      # redirect_to action: :show
    end
  end

  def sign_off
    session.clear
    @articles = Article.all
    redirect_to 'articles/index'
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :email)
    end
end
