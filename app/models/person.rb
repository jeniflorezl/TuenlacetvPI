class Person < ApplicationRecord
  belongs_to :type_document
  belongs_to :neighborhood
  belongs_to :zone
  has_many :entities
  validates :type_document_id, :documento, :nombre1, :apellido1, :apellido2, :direccion, 
  :neighborhood_id, :zone_id, :telefono1, :correo, :fechanac, :tipopersona, :estrato, 
  :usuario, presence: true #obligatorio
end
