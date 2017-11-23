class CreateEntities < ActiveRecord::Migration[5.1]
  def up
    create_table :entities do |t|
      t.references :function, foreign_key: true
      t.references :person, foreign_key: true
      t.datetime :fechacre
      t.datetime :fechacam
      t.varchar :usuario, limit: 15, null:false
    end
    execute <<-SQL
    ALTER TABLE entities
      ADD CONSTRAINT DF_entities_fechacre 
      DEFAULT (getdate()) FOR fechacre
    ALTER TABLE entities
      ADD CONSTRAINT DF_entities_fechacam  
      DEFAULT (getdate()) FOR fechacam
    SQL
  end

  def down
    execute <<-SQL
    ALTER TABLE entities
      DROP CONSTRAINT DF_entities_fechacre
    ALTER TABLE entities
      DROP CONSTRAINT DF_entities_fechacam
    SQL
    drop_table :entities
  end
end
