class QuestionsController < ApplicationController
  before_action :authenticate_user! # ログイン時のみ使用可能
  before_action :set_question, only: [:show, :edit, :update, :destroy, :vote_up, :vote_down]
  before_action :set_question_tags_to_gon, only: [:edit]
  before_action :set_available_tags_to_gon, only: [:new, :edit]

  def index
    @questions = Question.all
  end

  def show
    @answer = @question.answers.build
    @answers = @question.answers
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

  def vote_up
    respond_to do |format|
      @question.increment!(:vote_count, 1)
      format.js { render :vote }
    end
  end

  def vote_down
    respond_to do |format|
      @question.decrement!(:vote_count, 1)
      format.js { render :vote }
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :content, :tag_list)
  end

  def set_question
    @question = Question.find(params[:id])
  end

  # gonでタグリストをapplication.jsへ渡す
  def set_question_tags_to_gon
    gon.question_tags = @question.tag_list
  end

  # gonでタグのオートコンプリートリストをapplication.jsへ渡す
  def set_available_tags_to_gon
    gon.available_tags = Question.tags_on(:tags).pluck(:name)
  end

end
