class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
      t.varchar :login, limit: 10, null:false
      t.varchar :nombre, limit: 80, null:false
      t.varchar :clave, limit: 15, null:false
      t.char :nivel, limit: 1
      t.datetime :fechacre
      t.datetime :fechacam
      t.varchar :usuario, limit: 15, null:false
    end
    execute <<-SQL
    ALTER TABLE users
      ADD CONSTRAINT DF_users_fechacre 
      DEFAULT (getdate()) FOR fechacre
    ALTER TABLE users
      ADD CONSTRAINT DF_users_fechacam  
      DEFAULT (getdate()) FOR fechacam
    SQL
  end

  def down
    execute <<-SQL
    ALTER TABLE users
      DROP CONSTRAINT DF_users_fechacre
    ALTER TABLE users
      DROP CONSTRAINT DF_users_fechacam
    SQL
    drop_table :users
  end

end
