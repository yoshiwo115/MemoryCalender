class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  #viewでも使えるようにする
  helper_method :current_user

  def current_user
    #ログイン状態ならば
    if session[:user_id]
      #||= current_userがnilではないなら右の値を入れる
      current_user ||= User.find(session[:user_id])
    end
  end

  def login?
    if current_user.nil?
      redirect_to login_path, alert: "You must log in."
    end
  end

  def already_login?
    unless current_user.nil?
      redirect_to root_path, alert: "You are already logged in."
    end
  end

end
