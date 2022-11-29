class Candidate < ApplicationRecord
  has_many :interviews
  has_many :stages, through: :interviews
  belongs_to :stage
  validates :first_name, :last_name, presence: true
end
