class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, foreign_key: :question_id
  has_many :question_votes, foreign_key: :question_id

  validates :question, presence: true, uniqueness: true
end
