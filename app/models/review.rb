class Review < ApplicationRecord
  belongs_to :car

  validates :comment, presence: true
  validates :comment, length: { minimum: 5, message: 'Must have at least 5 characters' }
  validates :rating, presence: true
end
