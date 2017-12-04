class Rate < ApplicationRecord
  belongs_to :plan
  belongs_to :zone
  belongs_to :concept
  validates :zone_id, :concept_id, :plan_id, :valor, :estado, :usuario, presence: true #obligatorio
end
