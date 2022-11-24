class Role < ApplicationRecord
  has_many :stages
  belongs_to :user, optional: true
  validates :title, :description, presence: true
  after_create :create_default_stages

  BASE_ROLES = {
    "Front-End Developer" => %w[Screening Technical Pair-Programming Final],
    "Back-End Developer" => %w[Screening Technical Pair-Programming Final],
    "Full-Stack Developer" => %w[Screening Technical Manager Pair-Programming Final],
    "Software Engineer" => %w[Screening Technical Manager Pair-Programming Final],
    "DevOps Engineer" => %w[Screening Technical Pair-Programming Final],
    "Sales Engineer" => %w[Screening Technical Final],
    "Project Manager" => %w[Screening Technical Operation Final]
  }

  def create_default_stages
    BASE_ROLES[title].each do |stage|
      Stage.create(name: stage, role: self)
    end
  end
end
