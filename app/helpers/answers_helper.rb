module AnswersHelper
  def answer_time(answer)
    '回答日時:' + answer.updated_at.strftime('%y年%m月%d日 %H:%M')
  end
end
