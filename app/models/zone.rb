class Zone < ApplicationRecord
    has_many :neighborhoods
    has_many :rates
    has_many :concepts, :through => :rates
    has_many :people
    has_many :signal_tvs
    validates :city_id, :nombre, :usuario, presence: true #obligatorio
end
