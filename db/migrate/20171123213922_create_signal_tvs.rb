class CreateSignalTvs < ActiveRecord::Migration[5.1]
  def up
    create_table :signal_tvs do |t|
      t.references :entity, foreign_key: true
      t.varchar :contrato, limit: 20
      t.varchar :direccion, limit: 200
      t.varchar :urbanizacion, limit: 200
      t.varchar :torre, limit: 20
      t.varchar :apto, limit: 20
      t.integer :estrato
      t.varchar :vivienda, limit: 20
      t.varchar :telefono1, limit: 20
      t.varchar :telefono2, limit: 20
      t.varchar :contacto, limit: 20
      t.references :neighborhood, foreign_key: true
      t.references :zone, foreign_key: true
      t.datetime :fechacontrato, null:false
      t.integer :numerotvs
      t.char :estado, limit: 1, null:false
      t.references :rate, foreign_key: true
      t.varchar :precinto, limit: 10
      t.references :type_installation, foreign_key: true
      t.references :technology, foreign_key: true
      t.varchar :tiposervicio, limit: 20
      t.varchar :areainstalacion, limit: 20
      t.datetime :fechacre
      t.datetime :fechacam
      t.varchar :usuario, limit: 15, null:false
    end
    execute <<-SQL
    ALTER TABLE signal_tvs
      ADD CONSTRAINT DF_signal_tvs_fechacre 
      DEFAULT (getdate()) FOR fechacre
    ALTER TABLE signal_tvs
      ADD CONSTRAINT DF_signal_tvs_fechacam  
      DEFAULT (getdate()) FOR fechacam
    SQL
  end

  def down
    execute <<-SQL
    ALTER TABLE signal_tvs
      DROP CONSTRAINT DF_signal_tvs_fechacre
    ALTER TABLE signal_tvs
      DROP CONSTRAINT DF_signal_tvs_fechacam
    SQL
    drop_table :signal_tvs
  end
end
