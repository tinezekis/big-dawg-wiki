class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user) #fix sign-up
      redirect_to articles_you_should_read_path
    else
      render 'new'
    end
  end


  def show
    @articles = Article.unpublished_for(self)

  end
  
  def index

  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
