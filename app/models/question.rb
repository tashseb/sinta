class Question < ApplicationRecord
  belongs_to :stage
  validates :description, presence: true
end
