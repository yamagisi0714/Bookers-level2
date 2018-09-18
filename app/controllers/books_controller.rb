class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
  	@user = current_user
    @userprofile = User.all
    @newbook = Book.new
    @books = Book.all
  end

  def create
    @newbook = Book.new(book_params)
    @newbook.user_id = current_user.id
    if @newbook.save
       redirect_to book_path(@newbook), notice: "successfully"
    else
      # logger.info("----------------")
      # logger.info(book.errors.full_messages)
      # logger.info("----------------")
      @user = current_user
      @books = Book.all
      render :action => "index"
     end
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
     if @book.update(book_params)
       redirect_to book_path, notice: "successfully"
     else
       render :action => "edit"
     end
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: "successfully"
  end
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
 