class CreateQuestionsTable < ActiveRecord::Migration[4.2]
  def change
    create_table :questions do |t|
      t.integer :user_id, foreign_key: true, index: true
      t.string :question
      t.string :question_detail
    end

    create_table :answers do |t|
      t.integer :question_id, foreign_key: true, index: true
      t.integer :user_id, foreign_key: true, index: true
      t.string :answer
    end
  end
end
