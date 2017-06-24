class Question < ActiveRecord::Base
  # 質問はユーザーに紐付く
  belongs_to :user
  # 質問：回答は１対多の関係
  has_many :answers, dependent: :destroy
  # 1件の質問に対して複数のユーザーがlikeできる
  has_many :likes, dependent: :destroy
  # 1件の質問に対してlikeした全てのユーザーを繋げる
  has_many :liked_users, through: :likes, source: :user

  # タイトル、本文は必須入力
  validates :title, presence: true
  validates :content, presence: true

  # Questionモデルにタグ付け設定
  acts_as_taggable
end
