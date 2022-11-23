class User < ApplicationRecord
  has_many :roles
  has_many :interviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true
  validates :position, :department, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
