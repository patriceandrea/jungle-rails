class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:alert] = "Password or Email was incorrect. Please try again."
      redirect_to '/sessions'
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to '/sessions'
  end
end
