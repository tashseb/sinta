class Stage < ApplicationRecord
  has_many :questions
  has_many :candidates
  has_many :interviews
  has_many :stage_interviewers
  has_many :users, through: :stage_interviewers
  belongs_to :role

  validates :name, presence: true
end
