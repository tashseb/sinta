class Role < ApplicationRecord
  has_many :stages
  belongs_to :user, optional: true
  validates :title, :description, presence: true
  BASE_ROLE = [
    "Front-End Developer",
    "Back-End Developer",
    "Full-Stack Developer",
    "Software Engineer",
    "DevOps Engineer",
    "UI Designer",
    "UX Designer",
    "Sales Engineer",
    "Project Manager"
  ]

  BASE_STAGES = {
    front_end: %w[Screening Technical Pair-Programming Final],
    back_end: %w[Screening Technical Pair-Programming Final],
    full_stack: %w[Screening Technical Manager Pair-Programming Final],
    sales_engineer: %w[Screening Technical Final],
    project_manager: %w[Screening Technical Operation Final]
  }
end
