class TagsController < ApplicationController
  def index
    @tags = Question.tags_on(:tags) # questionsテーブルと紐付いているtagデータを取り出す
    @tags = @tags.order("taggings_count DESC")  # 人気用  tagsテーブルのタグカウントカラムを降順に並べ替え
    @tags_name = @tags.reorder("name")  # 名前用  tagsテーブルの名前を昇順に並べ替え
    @tags_new = @tags.reorder("id DESC")  #  新着用  idで降順に並べ替え
    @questions_one_week = Question.where(created_at: 1.week.ago..Time.current)
    @questions_one_month = Question.where(created_at: 1.month.ago..Time.current)
    if params[:search]
      @tags = @tags.where(['name LIKE ?', "%#{params[:search]}%"])  # params[:search]の値が含まれているタグを取り出す
    end
  end
end
