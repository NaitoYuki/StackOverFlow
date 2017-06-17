class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :question, index: true, null: false, foreign_key: true
      t.references :user, index: true, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
