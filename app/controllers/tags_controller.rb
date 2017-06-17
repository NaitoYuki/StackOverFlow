class TagsController < ApplicationController
  def index
    @tags = Question.tags_on(:tags)
    if params[:search]
      @tags = @tags.where(['name LIKE ?', "%#{params[:search]}%"])
    end
  end
end
