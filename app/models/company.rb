class Company < ApplicationRecord
    validates :nit, :nombre, :direccion, :telefono1, :telefono2, :fax, :contacto, :correo, 
    :regimen, :actividade, :contribuyente, :resolucionCntv, :representante, :idciudad, 
    :usuario, presence: true #obligatorio
end
