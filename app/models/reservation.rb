class Reservation < ApplicationRecord
  belongs_to :boxe
  belongs_to :user
end
