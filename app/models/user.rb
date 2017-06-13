class User < ActiveRecord::Base
  # ユーザー：質問は１対多の関係
  has_many :questions, dependent: :destroy
  # ユーザー：回答は１対多の関係
  has_many :answers, dependent: :destroy  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
