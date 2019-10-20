class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def show
  	@book2 = Book.find(params[:id])
    @user = @book2.user
    @book = Book.new
  end

  def new
  	@book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
      @book = Book.new
      @book = Book.find(params[:id])
      if @book.update(book_params)
        flash[:notice]="successfully updated"
        redirect_to book_path(@book.id)
      else
        render :edit
      end
    end


    def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
    if @book.save
      flash[:notice]="successfully posted"
    redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
  	end
  end

  private

	def book_params
		params.require(:book).permit(:title, :body)
	end
end
