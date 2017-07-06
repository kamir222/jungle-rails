class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    puts params.inspect
    @user = User.new(user_params)


    if @user.save
      puts User.all
      redirect_to root_path, notice: 'User created!'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password_digest
    )
  end
end
