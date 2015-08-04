class SessionsController < ApplicationController
  def new
    redirect_to '/articles/you_should_read' if current_user
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:sessions][:username])
    if @user && @user.authenticate(params[:sessions][:password])
      login(@user)
      redirect_to articles_you_should_read_path
    else
      # flash.now[:notice] = 'Invalid Email/password combination'
      @errors = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
