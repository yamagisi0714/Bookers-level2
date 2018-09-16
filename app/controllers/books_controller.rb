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
       redirect_to book_path(book), notice: "Book was successfully created."
    else
      # logger.info("----------------")
      # logger.info(book.errors.full_messages)
      # logger.info("----------------")
        render :template => "user/show"
     end
  end

  def show
  end

  def edit
  end
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
