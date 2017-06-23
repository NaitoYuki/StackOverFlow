module TagsHelper
  def tags_created_at(tag)
    questions = Question.tagged_with(tag)
    questions = questions.order("created_at DESC")
    question = questions.first
    return question.created_at
  end
end
