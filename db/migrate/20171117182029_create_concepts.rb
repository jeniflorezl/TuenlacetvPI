class CreateConcepts < ActiveRecord::Migration[5.1]
  def up
    create_table :concepts do |t|
      t.char :tipo, limit: 2, null:false
      t.varchar :descripcion, limit: 50, null:false
      t.char :operacion, limit: 1, null:false
      t.char :clase, limit: 1, null:false
      t.float :iva, null:false
      t.char :tipodoc, limit: 3, null:false
      t.varchar :observa, limit: 100
      t.datetime :fechacre
      t.datetime :fechacam
      t.varchar :usuario, limit: 15, null:false
    end
    execute <<-SQL
    ALTER TABLE concepts
      ADD CONSTRAINT DF_concepts_fechacre  
      DEFAULT (getdate()) FOR fechacre
    ALTER TABLE concepts
      ADD CONSTRAINT DF_concepts_fechacam  
      DEFAULT (getdate()) FOR fechacam
    SQL
  end

  def down
    execute <<-SQL
    ALTER TABLE concepts
      DROP CONSTRAINT DF_concepts_fechacre
    ALTER TABLE concepts
      DROP CONSTRAINT DF_concepts_fechacam
    SQL
    drop_table :concepts
  end

end
