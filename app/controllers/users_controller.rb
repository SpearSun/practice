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

  private
    def user_params
      params.require(:user).permit(:name, :password, :email)
    end
end
