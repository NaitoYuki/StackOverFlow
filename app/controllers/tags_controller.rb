class TagsController < ApplicationController
  def index
    @tags = Question.tags_on(:tags)
    @tags = @tags.order("taggings_count DESC")
    @tags_name = @tags.reorder("name")
    @tags_new = @tags.reorder("id DESC")
    @questions_one_week = Question.where(created_at: 1.week.ago..Time.current)
    @questions_one_month = Question.where(created_at: 1.month.ago..Time.current)
    if params[:search]
      @tags = @tags.where(['name LIKE ?', "%#{params[:search]}%"])
    end
  end
end
