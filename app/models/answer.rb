class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :answer_votes, foreign_key: :answer_id

end
