class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]


  def update
    if @user.update(user_params)
      flash[:notice] = "User was successfully updated"
      redirect_to user_path
    else
      flash.now[:alert] = "User was failed to update"
      render :edit
    end 
  end


  private
  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :intro, :avatar)
  end
end
