class Interview < ApplicationRecord
  belongs_to :user
  belongs_to :candidate
  belongs_to :stage
  validates :status, presence: true
  # validates :rating, comparison: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  STATUS = ["Pending", "Failed", "Passed"]
  enum status: { pending: "Pending", failed: "Failed", passed: "Passed" }, _default: :pending

  def pending?
    status == 'Pending'
  end

  def accepted?
    status == 'Passed'
  end

  def rejected?
    status == 'Failed'
  end
end
