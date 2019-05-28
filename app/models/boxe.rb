class Boxe < ApplicationRecord
  belongs_to :user
  validates :price_per_day, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :caracteristics, presence: true
end
