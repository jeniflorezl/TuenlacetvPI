class CreatePeople < ActiveRecord::Migration[5.1]
  def up
    create_table :people do |t|
      t.references :type_document, foreign_key: true
      t.varchar :documento, limit: 12, null:false
      t.varchar :nombre1, limit: 50, null:false
      t.varchar :nombre2, limit: 50
      t.varchar :apellido1, limit: 50, null:false
      t.varchar :apellido2, limit: 50
      t.varchar :direccion, limit: 200
      t.references :neighborhood, foreign_key: true
      t.references :zone, foreign_key: true
      t.varchar :telefono1, limit: 20
      t.varchar :telefono2, limit: 20
      t.varchar :correo, limit: 50
      t.datetime :fechanac
      t.char :tipopersona, limit: 2, null:false
      t.integer :estrato
      t.datetime :fechacre
      t.datetime :fechacam
      t.varchar :usuario, limit: 15, null:false
    end
    execute <<-SQL
    ALTER TABLE people
      ADD CONSTRAINT DF_people_fechacre  
      DEFAULT (getdate()) FOR fechacre
    ALTER TABLE people
      ADD CONSTRAINT DF_people_fechacam  
      DEFAULT (getdate()) FOR fechacam
    SQL
  end

  def down
    execute <<-SQL
    ALTER TABLE people
      DROP CONSTRAINT DF_people_fechacre
    ALTER TABLE people
      DROP CONSTRAINT DF_people_fechacam
    SQL
    drop_table :people
  end

end
