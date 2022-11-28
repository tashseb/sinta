class Candidate < ApplicationRecord
  has_many :interviews
  belongs_to :stage
  validates :first_name, :last_name, :status, presence: true
  STATUS = ["pending", "rejected", "accepted"]
  enum status: { pending: "pending", rejected: "rejected", accepted: "accepted" }, _default: :pending

  def pending?
    status == 'pending'
  end

  def accepted?
    status == 'accepted'
  end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def avatar
    Initials.svg(this.full_name)
  end
end
