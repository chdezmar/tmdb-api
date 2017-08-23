class SessionsController < ApplicationController
  def new
    #change root url
    #redirect_to root_url, notice: 'You are already logged in' if current_user
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'You are now logged in'
    else
      # form_with -> https://github.com/turbolinks/turbolinks/issues/85#issuecomment-299644281
      redirect_to new_session_url, notice: 'Invalid password or email'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'You are now logged out!'
  end
end
