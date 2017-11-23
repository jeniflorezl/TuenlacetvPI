class CreateFunctions < ActiveRecord::Migration[5.1]
  def up
    create_table :functions do |t|
      t.varchar :nombre, limit: 50, null:false
      t.datetime :fechacre
      t.datetime :fechacam
      t.varchar :usuario, limit: 15, null:false
    end
    execute <<-SQL
    ALTER TABLE functions
      ADD CONSTRAINT DF_functions_fechacre  
      DEFAULT (getdate()) FOR fechacre
    ALTER TABLE functions
      ADD CONSTRAINT DF_functions_fechacam  
      DEFAULT (getdate()) FOR fechacam
    SQL
  end

  def down
    execute <<-SQL
    ALTER TABLE functions
      DROP CONSTRAINT DF_functions_fechacre
    ALTER TABLE functions
      DROP CONSTRAINT DF_functions_fechacam
    SQL
    drop_table :functions
  end
  
end
