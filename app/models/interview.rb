class Interview < ApplicationRecord
  belongs_to :user
  belongs_to :candidate
  belongs_to :stage
  validates :status, presence: true
  # validates :rating, comparison: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  STATUS = ["pending", "rejected", "accepted"]
  enum status: { pending: "pending", rejected: "rejected", accepted: "accepted" }, _default: :pending

  def pending?
    status == 'pending'
  end

  def accepted?
    status == 'accepted'
  end

  def rejected?
    status == 'rejected'
  end
end
