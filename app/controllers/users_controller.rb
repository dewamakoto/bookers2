class UsersController < ApplicationController
  before_action :authenticate_user!
  def new
    @user = User.new
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.reverse_order
  end

  def index
  	@users = User.all
    @user = current_user
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user = current_user
  else
    render 'books/index'
  end
 end

  def destroy
  	@user = User.find(params[:id])
  end


    def update
      @user = User.new
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice]="successfully posted"
        redirect_to user_path(@user.id)
      else
        render :edit
      end
    end

  private
  def user_params
  	params.require(:user).permit(:name, :image, :introduction)
  end

end
