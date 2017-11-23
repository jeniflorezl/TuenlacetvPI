class Concept < ApplicationRecord
    has_many :rates
    has_many :zones, :through => :rates
end
