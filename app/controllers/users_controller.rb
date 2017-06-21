class UsersController < ApplicationController
  def index
    @users = User.all.includes(:answers, :questions).where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
  end
end
