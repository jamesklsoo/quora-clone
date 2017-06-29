require 'bcrypt'

class User < ActiveRecord::Base
  has_secure_password
  has_many :questions, foreign_key: :user_id
  has_many :answers, foreign_key: :user_id
  has_many :question_votes, foreign_key: :user_id
  has_many :answer_votes, foreign_key: :user_id

  validates :email, uniqueness: true, presence: true, format: {
    with: /[^@]+@{1}[^@]+/,
  message: "Invalid email" }
  validates :password, presence: true, length: { minimum: 8 }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def fullname
    "#{first_name} #{last_name}"
  end
end
