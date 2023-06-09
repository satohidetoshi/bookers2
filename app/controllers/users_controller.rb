class UsersController < ApplicationController
  def index
    
    
     @users = User.all
    @book_new = Book.new


  end


    def create

    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
   redirect_to book_path(@book.id), flash: { notice: 'Book was successfully created.' }
    else
       @books = Book.all
      render :index
    end

    end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user.id), flash: { notice: 'Book was successfully created.' }

    else
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  private


 def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
 end

end