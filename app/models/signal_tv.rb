class SignalTv < ApplicationRecord
  belongs_to :entity
  belongs_to :neighborhood
  belongs_to :zone
  belongs_to :rate
  belongs_to :type_installation
  belongs_to :technology
end
