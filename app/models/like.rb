class Like < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  # 1人がlikeできる数(1質問に対して、1いいね(like))
  validates_uniqueness_of :question_id, scope: :user_id
end
