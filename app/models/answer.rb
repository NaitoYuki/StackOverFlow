class Answer < ActiveRecord::Base
  # 回答は質問に紐付く
  belongs_to :question
  # 回答はユーザーに紐付く
  belongs_to :user
  # 本文は必須入力
  validates :content, presence: true
end
