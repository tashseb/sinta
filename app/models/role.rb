class Role < ApplicationRecord
  has_many :stages
  has_many :candidates, through: :stages
  has_many :interviews, through: :candidates
  belongs_to :user, optional: true
  validates :title, :description, presence: true
  after_create :create_default_stages

  BASE_ROLES = {
    "Front-End Developer" => %w[Screening Technical Pair-Programming Culture],
    "Back-End Developer" => %w[Screening Technical Pair-Programming],
    "Full-Stack Developer" => %w[Screening Technical Manager Pair-Programming],
    "Software Engineer" => %w[Screening Technical Manager Pair-Programming],
    "DevOps Engineer" => %w[Screening Technical Pair-Programming],
    "Sales Engineer" => %w[Screening Technical Behavioral],
    "Project Manager" => %w[Screening Technical Operation]
  }

  def pending_interviews_count
    return 0 if stages.count.zero?

    interviews.group_by(&:candidate).count { |_candidate, interviews| interviews.last.feedback }
  end

  def create_default_stages
    BASE_ROLES[title]&.each do |stage|
      Stage.create(name: stage, role: self)
    end
  end
end
