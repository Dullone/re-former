class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(create_user_params)
    if user
      user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(create_user_params)
      redirect_to new_user_path
    else
      render :edit
    end
  end

  def create_user_params
    params.require(:user).permit(:name, :email, :password)    
  end
end
