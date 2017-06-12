class QuestionsController < ApplicationController
  before_action :authenticate_user! # ログイン時のみ使用可能
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show
    # TODO: Answerモデル実装後に作成
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_to questions_path, notice: "質問を投稿しました！"
    else
      render 'new'
    end
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path, notice: "質問を更新しました!"
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice: "質問を削除しました！"
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end

  def set_question
    @question = Question.find(params[:id])
  end

end
