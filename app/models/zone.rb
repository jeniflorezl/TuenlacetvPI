class Zone < ApplicationRecord
    belongs_to :city
    has_many :neighborhoods
    has_many :rates
    has_many :concepts, :through => :rates
end
