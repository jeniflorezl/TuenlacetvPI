class CreateNeighborhoods < ActiveRecord::Migration[5.1]
  def up
    create_table :neighborhoods do |t|
      t.references :zone, foreign_key: true
      t.varchar :nombre, limit: 50, null:false
      t.datetime :fechacre
      t.datetime :fechacam
      t.varchar :usuario, limit: 15, null:false
    end
    execute <<-SQL
    ALTER TABLE neighborhoods
      ADD CONSTRAINT DF_neighborhoods_fechacre  
      DEFAULT (getdate()) FOR fechacre
    ALTER TABLE neighborhoods
      ADD CONSTRAINT DF_neighborhoods_fechacam  
      DEFAULT (getdate()) FOR fechacam
    SQL
  end

  def down
    execute <<-SQL
    ALTER TABLE neighborhoods
      DROP CONSTRAINT DF_neighborhoods_fechacre
    ALTER TABLE neighborhoods
      DROP CONSTRAINT DF_neighborhoods_fechacam
    SQL
    drop_table :neighborhoods
  end


end
