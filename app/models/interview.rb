class Interview < ApplicationRecord
  belongs_to :user
  belongs_to :candidate
  belongs_to :stage
  validates :feedback, :rating, presence: true
  validates :rating, comparison: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
