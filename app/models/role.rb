class Role < ApplicationRecord
  has_many :stages
  belongs_to :user, optional: true
  validates :title, :description, presence: true
end
