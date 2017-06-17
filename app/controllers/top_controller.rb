class TopController < ApplicationController
  def index
    # テーブル情報の取得
    @user_counts = User.count
    @question_counts = Question.count
    @answer_counts = Answer.count

    # 質問情報の取得
    @tags = Question.tags_on(:tags)
    if params[:tag].present?
      @questions = Question.tagged_with(params[:tag])
    else
      @questions = Question.all
    end
    @questions = @questions.includes(:tags)
  end
end
