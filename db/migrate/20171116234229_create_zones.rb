class CreateZones < ActiveRecord::Migration[5.1]
  def up
    create_table :zones do |t|
      t.char :tipo, limit: 2, null:false
      t.varchar :nombre, limit: 50, null:false
      t.varchar :dirquejas, limit: 100
      t.datetime :fechacre
      t.datetime :fechacam
      t.varchar :usuario, limit: 15, null:false
    end
    execute <<-SQL
    ALTER TABLE zones
      ADD CONSTRAINT DF_zones_fechacre  
      DEFAULT (getdate()) FOR fechacre
    ALTER TABLE zones
      ADD CONSTRAINT DF_zones_fechacam  
      DEFAULT (getdate()) FOR fechacam
    SQL
  end

  def down
    execute <<-SQL
    ALTER TABLE zones
      DROP CONSTRAINT DF_zones_fechacre
    ALTER TABLE zones
      DROP CONSTRAINT DF_zones_fechacam
    SQL
    drop_table :zones
  end
end
