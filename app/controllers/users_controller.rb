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

  def index
    @dawgs = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(permission_level: "big_dawg")
    # p "tacooos"
    # p @user.errors.full_messages
    # p @user.save
    username = @user.username
    permission_level = @user.permission_level
    if request.xhr?
      render json: @user.to_json
    else
      redirect_to '/users'
    end
    # redirect_to '/users'
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
