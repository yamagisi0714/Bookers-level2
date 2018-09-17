class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
  	@user = User.find(current_user.id)
    @userprofile = User.all
    @newbook = Book.new
    @books = Book.all
  end

  def new
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
       redirect_to book_path(book), notice: "successfully"
    else
      # logger.info("----------------")
      # logger.info(book.errors.full_messages)
      # logger.info("----------------")
        render :template => "user/show"
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
    book = Book.find(params[:id])
     if book.update(book_params)
       redirect_to book_path, notice: "successfully"
     else
       render acition: :edit
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
 