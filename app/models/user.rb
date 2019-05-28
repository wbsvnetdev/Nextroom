class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :boxes
  has_many :boxes, through: :reservation
  has_many :reservations
  validates :email, presence: true, uniqueness: true
end
