class Reservation < ApplicationRecord
  belongs_to :boxe
  belongs_to :user
  validates :total_price, presence: true
end
