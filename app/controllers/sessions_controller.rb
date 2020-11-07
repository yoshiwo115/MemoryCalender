class SessionsController < ApplicationController
  before_action :already_login?, except: :destroy 
  
  def new
  end

  def create
    #emailでユーザーを探す
    user = User.find_by_email(params[:email])
    
    #ユーザーのパスワードが正しければ
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "successfully logged in"
    else
      flash.now[:alert] = "Email or Password is invalid."
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "successfully logged out"
  end
end
