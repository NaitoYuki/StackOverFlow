class UsersController < ApplicationController
  def index
    @users = User.all.includes(:answers, :questions)
  end

  def show
    @user = User.find(params[:id])
  end
end
