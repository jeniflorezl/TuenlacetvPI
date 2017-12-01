class Entity < ApplicationRecord
  belongs_to :function
  belongs_to :person
  has_many :signal_tvs
  
end
