class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id.to_s
      redirect_to posts_path, notice: 'Logged in.'
    else
      flash.now.alert = 'Incorrect email/password combination.'
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path, notice: 'Logged out.'
  end
end
