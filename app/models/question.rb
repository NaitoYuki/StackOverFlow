class Question < ActiveRecord::Base
  # 質問はユーザーに紐付く
  belongs_to :user
  # 質問：回答は１対多の関係
  has_many :answers, dependent: :destroy

  # タイトル、本文は必須入力
  validates :title, presence: true
  validates :content, presence: true
end
