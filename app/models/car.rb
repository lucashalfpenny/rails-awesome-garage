class Car < ApplicationRecord
  belongs_to :owner
  has_many :reviews, dependent: :destroy
  has_many :favourites, dependent: :destroy

  validates :brand, presence: true
  validates :model, presence: true
  validates :year, numericality: { only_integer: true, greater_than: 1909 }
  validates :fuel, presence: true
end
