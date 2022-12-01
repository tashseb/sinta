class Interview < ApplicationRecord
  belongs_to :user
  belongs_to :candidate
  belongs_to :stage
  validates :status, presence: true
  # validates :rating, comparison: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  STATUS = ["pending", "Failed", "Passed"]
  enum status: { pending: "pending", failed: "Failed", passed: "Passed" }, _default: :pending

  def pending?
    status == 'pending'
  end

  def accepted?
    status == 'passed'
  end

  def rejected?
    status == 'failed'
  end
end
