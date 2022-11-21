class Role < ApplicationRecord
  has_many :stages
  belongs_to :user
  validates :title, :description, presence: true
end
