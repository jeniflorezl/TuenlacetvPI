class CreateTechnologies < ActiveRecord::Migration[5.1]
  def up
    create_table :technologies do |t|
      t.varchar :nombre, limit: 50, null:false
      t.datetime :fechacre
      t.datetime :fechacam
      t.varchar :usuario, limit: 15, null:false
    end
    execute <<-SQL
    ALTER TABLE technologies
      ADD CONSTRAINT DF_technologies_fechacre  
      DEFAULT (getdate()) FOR fechacre
    ALTER TABLE technologies
      ADD CONSTRAINT DF_technologies_fechacam  
      DEFAULT (getdate()) FOR fechacam
    SQL
  end

  def down
    execute <<-SQL
    ALTER TABLE technologies
      DROP CONSTRAINT DF_technologies_fechacre
    ALTER TABLE technologies
      DROP CONSTRAINT DF_technologies_fechacam
    SQL
    drop_table :technologies
  end

end
