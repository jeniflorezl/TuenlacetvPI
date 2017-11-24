class CreateServices < ActiveRecord::Migration[5.1]
  def up
    create_table :services do |t|
      t.varchar :nombre, limit: 50, null:false
      t.datetime :fechacre
      t.datetime :fechacam
      t.varchar :usuario, limit: 15, null:false
    end
    execute <<-SQL
    ALTER TABLE services
      ADD CONSTRAINT DF_services_fechacre  
      DEFAULT (getdate()) FOR fechacre
    ALTER TABLE services
      ADD CONSTRAINT DF_services_fechacam  
      DEFAULT (getdate()) FOR fechacam
    SQL
  end

  def down
    execute <<-SQL
    ALTER TABLE services
      DROP CONSTRAINT DF_services_fechacre
    ALTER TABLE services
      DROP CONSTRAINT DF_services_fechacam
    SQL
    drop_table :services
  end

end
