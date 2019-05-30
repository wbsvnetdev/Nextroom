class Boxe < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :price_per_day, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :caracteristics, presence: true
end
