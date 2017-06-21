class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, only: [:edit, :update, :destroy, :vote_up, :vote_down]

  def edit
  end

  def update
    @answer.update(answer_params)
    redirect_to question_path(@answer.question), notice: "回答を更新しました！"
  end

  def create
    @answer = current_user.answers.build(answer_params)
    @question = @answer.question

    if @answer.save
      render :index
    else
      render 'questions/index'
    end
  end

  def destroy
    @answer.destroy
  end

  def vote_up
    @question = @answer.question
    @answer.increment!(:vote_count, 1)
    render :vote
  end

  def vote_down
    @question = @answer.question
    @answer.decrement!(:vote_count, 1)
    render :vote
  end

  private

  def answer_params
    params.require(:answer).permit(:question_id, :content)
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

end
