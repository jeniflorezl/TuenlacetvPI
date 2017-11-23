class Rate < ApplicationRecord
  belongs_to :plan
  belongs_to :zone
  belongs_to :concept
end
