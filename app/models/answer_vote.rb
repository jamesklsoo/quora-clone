class AnswerVote < ActiveRecord::Base
  belongs_to :answer
  belongs_to :user, foreign_key: :user_id

  validates :user_id, uniqueness: {scope: :answer_id}
end
