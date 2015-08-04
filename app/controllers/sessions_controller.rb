class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:sessions][:username])
    if @user && @user.authenticate(params[:sessions][:password])
      login(@user)
      redirect_to articles_path
    else
      # flash.now[:notice] = 'Invalid Email/password combination'
      @errors = 'Invalid email/password combination'
      p @errors
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
