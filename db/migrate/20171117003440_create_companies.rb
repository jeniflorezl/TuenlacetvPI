class CreateCompanies < ActiveRecord::Migration[5.1]
  def up
    create_table :companies do |t|
      t.char :tipo, limit: 2, null:false
      t.char :nit, limit: 13, null:false
      t.varchar :nombre, limit: 100, null:false
      t.varchar :direccion, limit: 100, null:false
      t.varchar :telefono1, limit: 50, null:false
      t.varchar :telefono2, limit: 50
      t.varchar :fax, limit: 50
      t.varchar :contacto, limit: 100
      t.varchar :correo, limit: 100
      t.char :regimen, limit: 1
      t.varchar :actividade, limit: 80
      t.varchar :contribuyente, limit: 80
      t.varchar :resolucionCntv, limit: 150
      t.varchar :representante, limit: 150
      t.char :idciudad, limit: 1 
      t.varchar :prefijo, limit: 5
      t.varchar :titulo1, limit: 100
      t.varchar :titulo2, limit: 100
      t.varchar :logo, limit: 100
      t.datetime :fechacre
      t.datetime :fechacam
      t.varchar :usuario, limit: 15, null:false  
    end
    execute <<-SQL
    ALTER TABLE companies
      ADD CONSTRAINT DF_companies_fechacre  
      DEFAULT (getdate()) FOR fechacre
    ALTER TABLE companies
      ADD CONSTRAINT DF_companies_fechacam  
      DEFAULT (getdate()) FOR fechacam
    SQL
  end

  def down
    execute <<-SQL
    ALTER TABLE companies
      DROP CONSTRAINT DF_companies_fechacre
    ALTER TABLE companies
      DROP CONSTRAINT DF_companies_fechacam
    SQL
    drop_table :companies
  end

end
