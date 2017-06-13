class Question < ActiveRecord::Base
  # 質問はユーザーに紐付く
  belongs_to :user

  # タイトル、本文は必須入力
  validates :title, presence: true
  validates :content, presence: true

  # Questionモデルにタグ付け設定
  acts_as_taggable

end
