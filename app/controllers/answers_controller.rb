class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, only: [:edit, :update, :destroy, :vote_up, :vote_down]

  def edit
  end

  def update
    if @answer.update(answer_params)
      redirect_to question_path(@answer.question), success: "回答を更新しました。"
    else
      redirect_to edit_question_answer_path(@answer.question, @answer), danger: "回答を入力してください。"
    end
  end

  def create
    @answer = current_user.answers.build(answer_params)
    @question = @answer.question

    if @answer.save
      render :index
    else
      redirect_to question_path(@answer.question), danger: "回答を入力してください。"
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
