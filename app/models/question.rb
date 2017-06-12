class Question < ActiveRecord::Base
  # 質問はユーザーに紐付く
  belongs_to :user

  # タイトル、本文は必須入力
  validate :title, presence: true
  validate :content, presence: true
end
