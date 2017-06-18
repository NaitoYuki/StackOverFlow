module TagsHelper
  # タグが作成された日時を返す関数
  def tags_created_at(tag)
    questions = Question.tagged_with(tag) # tagが付いた質問を取り出す
    questions = questions.order("created_at DESC") # 質問の作成日で降順に並び替え
    question = questions.first  # 最初の質問を取り出す
    return question.created_at  # 作成された日時を返す
  end
end
