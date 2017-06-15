class UsersController < ApplicationController
  def index
    @users = User.all
    @users = User.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
  end
end
