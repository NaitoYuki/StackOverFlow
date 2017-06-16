class TagsController < ApplicationController
  def index
    @tags = Question.tags_on(:tags)
  end
end
