class CreateQuestionTags < ActiveRecord::Migration[4.2]
  def change
    create_table :question_tags do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :question, index: true
      t.timestamps
    end
  end
end
