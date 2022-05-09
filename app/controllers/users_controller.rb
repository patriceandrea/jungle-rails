class UsersController < ApplicationController
  def new
  end
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:alert] = "Please make sure no inputs are empty.Passwords need a minimum of 3 characters. If an error still occurs, the email is already used."
      redirect_to '/users'
    end
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end