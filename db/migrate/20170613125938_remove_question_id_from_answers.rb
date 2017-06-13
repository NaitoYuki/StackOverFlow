class RemoveQuestionIdFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :question_id, :integer
  end
end
