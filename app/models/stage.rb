class Stage < ApplicationRecord
  has_many :questions
  has_many :candidates
  has_many :interviews
  has_many :stage_interviewers
  has_many :users, through: :stage_interviewers
  belongs_to :role

  validates :name, presence: true
  # after_create :create_default_stages

  # BASE_STAGES = {
  #   "Screening" => [
  #     "Tell me about yourself.",
  #     "What are your main responsibilities?",
  #     "Why are interested in this role?"
  #   ],
  #   "Technical" => [
  #     "What is an N+query? Is it good or bad?",
  #     "Can you make a simple database for Student and Teacher?",
  #     "What is MVC?"
  #   ],
  #   "Pair-Programming" => [
  #     "Fizz-Buzz problem",
  #     "Palindrome problem"
  #   ],
  #   "CEO" => [
  #     "Why do you want to join us?",
  #     "What makes you different from all the other candidates?",
  #     "Can you describe our company's vision in your own words?"
  #   ]
  # }

  # def create_default_stages
  #   BASE_STAGES[name]&.each do |question|
  #     Question.create(description: question, stage: self)
  #   end
  # end
end
