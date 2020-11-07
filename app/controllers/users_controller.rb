class UsersController < ApplicationController
  before_action :already_login?, only: :new
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save #userが保存されたら
      session[:user_id] = user.id
      redirect_to user_path, notice: "successsfully logged in"
    else
      render :new
      #アクションを介さずにnewを返す
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
