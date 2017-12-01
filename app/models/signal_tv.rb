class SignalTv < ApplicationRecord
  belongs_to :entity
  belongs_to :neighborhood
  belongs_to :zone
  belongs_to :rate
  belongs_to :type_installation
  belongs_to :technology
  validates :contrato, :direccion, :estrato, :vivienda, :telefono1, :neighborhood_id, :zone_id, 
  :fechacontrato, :numerotvs, :estado, :rate, :precinto, :type_installation, :technology,
  :tiposervicio, :areainstalacion, :usuario,  presence: true #obligatorio
end
