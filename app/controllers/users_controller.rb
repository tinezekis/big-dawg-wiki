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
    @dawgs = User.all.order(:created_at)
  end

  def upgrade
    redirect_to '/' if current_user.permission_level != "big_dawg"
    @user = User.find(params[:id])
    @user.update(permission_level: "big_dawg")
    username = @user.username
    permission_level = @user.permission_level
    if request.xhr?
      render json: @user.to_json
    else
      redirect_to '/users'
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
