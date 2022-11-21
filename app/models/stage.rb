class Stage < ApplicationRecord
  has_many :questions
  has_many :candidates
  has_many :interviews
  belongs_to :role

  validates :name, presence: true
end
