class City < ApplicationRecord
    has_many :zones
    validates :nombre, :codigo, :usuario, presence: true #obligatorio
end
