class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @user.email.downcase!

    if @user.save
      flash[:notice] = 'Account successfully created!'
      redirect_to posts_url
    else
      flash.now.alert = 'Email invalid. Could not create account'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation)
  end
end
