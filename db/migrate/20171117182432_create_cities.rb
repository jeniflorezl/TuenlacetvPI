class CreateCities < ActiveRecord::Migration[5.1]
  def up
    create_table :cities do |t|
      t.varchar :nombre, limit: 80, null:false
      t.char :codigo, limit: 5
      t.datetime :fechacre
      t.datetime :fechacam
      t.varchar :usuario, limit: 15, null:false
    end
    execute <<-SQL
    ALTER TABLE cities
      ADD CONSTRAINT DF_cities_fechacre  
      DEFAULT (getdate()) FOR fechacre
    ALTER TABLE cities
      ADD CONSTRAINT DF_cities_fechacam  
      DEFAULT (getdate()) FOR fechacam
    SQL
  end

  def down
    execute <<-SQL
    ALTER TABLE cities
      DROP CONSTRAINT DF_cities_fechacre
    ALTER TABLE cities
      DROP CONSTRAINT DF_cities_fechacam
    SQL
    drop_table :cities
  end


end
