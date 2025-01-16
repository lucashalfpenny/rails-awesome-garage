class Favourite < ApplicationRecord
  belongs_to :car

  # validates :car_id, uniqueness: true
end
