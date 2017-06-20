module QuestionsHelper
  def question_time(question)
    '質問日時:' + question.created_at.strftime('%y年%m月%d日 %H:%M')
  end
end
