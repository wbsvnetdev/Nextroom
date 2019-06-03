class Review < ApplicationRecord
  belongs_to :boxe
  validates :content, length: { minimum: 20 }
end
