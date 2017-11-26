class Person < ApplicationRecord
  belongs_to :type_document
  belongs_to :neighborhood
  belongs_to :zone
  has_many :entities
end
