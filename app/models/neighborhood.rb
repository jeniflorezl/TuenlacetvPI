class Neighborhood < ApplicationRecord
  belongs_to :zone
  validates :zone_id, :nombre, :usuario, presence: true #obligatorio
end
