class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @userprofile = User.all
    @newbook = Book.new
  end
  def show
  	@user = User.find(params[:id])
    @userprofile = User.all
    @newbook = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user)
    else
      render :action => "edit"
    end
  end
  private
	def user_params
    	params.require(:user).permit(:name, :profile_image, :introduction)
	end
end
