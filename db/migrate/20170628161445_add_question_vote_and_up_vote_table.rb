class AddQuestionVoteAndUpVoteTable < ActiveRecord::Migration[4.2]
  def change
    create_table :question_votes do |t|
      t.boolean :vote
      t.integer :user_id, foreign_key: true, index: true
      t.integer :question_id, foreign_key: true, index: true
    end

    create_table :answer_votes do |t|
      t.boolean :vote
      t.integer :user_id, foreign_key: true, index: true
      t.integer :answer_id, foreign_key: true, index: true
    end
  end
end
