class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(current_user.id)
    @userprofile = User.all
    @newbook = Book.new
  end
  def show
  	@user = User.find(params[:id])
    @userprofile = User.all
    @newbook = Book.new
    @books = current_user.books.all
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user)
    end
  end
  private
	def user_params
    	params.require(:user).permit(:name, :profile_image, :introduction)
	end
end
