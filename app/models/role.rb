class Role < ApplicationRecord
  has_many :stages
  belongs_to :user, optional: true
  validates :title, :description, presence: true
  after_create :create_default_stages

  BASE_ROLES = {
    "Front-End Developer" => %w[Screening Technical Pair-Programming CEO],
    "Back-End Developer" => %w[Screening Technical Pair-Programming],
    "Full-Stack Developer" => %w[Screening Technical Manager Pair-Programming],
    "Software Engineer" => %w[Screening Technical Manager Pair-Programming],
    "DevOps Engineer" => %w[Screening Technical Pair-Programming],
    "Sales Engineer" => %w[Screening Technical Behavioral],
    "Project Manager" => %w[Screening Technical Operation]
  }


  def create_default_stages
    BASE_ROLES[title]&.each do |stage|
      Stage.create(name: stage, role: self)
    end
  end
end
