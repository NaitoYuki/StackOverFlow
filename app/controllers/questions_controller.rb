class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :vote_up, :vote_down]
  before_action :set_question, only: [:show, :edit, :update, :destroy, :vote_up, :vote_down]
  before_action :set_question_tags_to_gon, only: [:edit]
  before_action :set_available_tags_to_gon, only: [:new, :edit, :create, :update, :show]

  def index
    # テーブル情報の取得
    @user_counts = User.count
    @question_counts = Question.count
    @answer_counts = Answer.count

    # タグ情報の取得
    @tags = Question.tags_on(:tags)
    if params[:tag].present?
      @questions = Question.tagged_with(params[:tag]) # タグによる抽出
    else
      @questions = Question.all
    end
    @questions = @questions.includes(:tags)
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
      redirect_to questions_path, success: "質問を投稿しました。"
    else
      render 'new'
    end
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path, success: "質問を更新しました。"
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, danger: "質問を削除しました。"
  end

  def vote_up
    @question.increment!(:vote_count, 1)
    render :vote
  end

  def vote_down
    @question.decrement!(:vote_count, 1)
    render :vote
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
