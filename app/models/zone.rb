class Zone < ApplicationRecord
    belongs_to :city
    has_many :neighborhoods
end
