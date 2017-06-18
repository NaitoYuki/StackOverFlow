class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @question = Question.find(params[:question_id])
    @like = Like.new(question_id: params[:question_id], user_id: current_user.id)

    @like.save
    render 'questions/show'

  end

  def destroy
    @like = Like.find_by(question_id: params[:question_id], user_id: current_user.id)
    @like.destroy
    redirect_to question_path(params[:question_id])
  end

  private
    def like_params
      params.require(:like).permit(:question_id, :user_id)
    end
end
