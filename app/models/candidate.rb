class Candidate < ApplicationRecord
  has_many :interviews
  has_many :stages, through: :interviews
  belongs_to :stage

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def avatar
    Initials.svg(this.full_name)
  end

  validates :first_name, :last_name, presence: true

end
