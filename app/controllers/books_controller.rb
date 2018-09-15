class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
  	@user = User.find(current_user.id)
    @userprofile = User.all
    @newbook = Book.new
  end

  def new
  end

  def show
  end

  def edit
  end
end
