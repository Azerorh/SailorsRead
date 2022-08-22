class AdminController < ApplicationController
  def users
    @users = User.all
  end

  def set_admin
    @user = User.find(params[:id])

    @user.update_attribute(:is_admin, true)
  end

end
