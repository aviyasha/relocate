class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :show, :update]

  def show
  end

  def edit
  end

  def update
    @user.update user_params

    redirect_to user_path(@user)
  end

  private

  def set_user
  	@user = User.find params[:id]
  end

  def user_params
  	params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :profession,
      :education,
      :birth_date,
      :about,
      :avatar,
      :resume
    )
  end
end
