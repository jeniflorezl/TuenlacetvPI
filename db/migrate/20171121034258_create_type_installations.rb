class CreateTypeInstallations < ActiveRecord::Migration[5.1]
  def up
    create_table :type_installations do |t|
      t.varchar :nombre, limit: 50, null:false
      t.datetime :fechacre
      t.datetime :fechacam
      t.varchar :usuario, limit: 15, null:false
    end
    execute <<-SQL
    ALTER TABLE type_installations
      ADD CONSTRAINT DF_type_installations_fechacre  
      DEFAULT (getdate()) FOR fechacre
    ALTER TABLE type_installations
      ADD CONSTRAINT DF_type_installations_fechacam  
      DEFAULT (getdate()) FOR fechacam
    SQL
  end

  def down
    execute <<-SQL
    ALTER TABLE type_installations
      DROP CONSTRAINT DF_type_installations_fechacre
    ALTER TABLE type_installations
      DROP CONSTRAINT DF_type_installations_fechacam
    SQL
    drop_table :type_installations
  end
end
