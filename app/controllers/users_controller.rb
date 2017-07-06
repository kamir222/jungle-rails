class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if User.exists?(:email => user_params[:email])
      redirect_to '/users/new'
    else
      @user = User.new(user_params)
      if @user.save
        redirect_to root_path, notice: 'User created!'
      else
        render :new
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
