class CreatePlans < ActiveRecord::Migration[5.1]
  def up
    create_table :plans do |t|
      t.varchar :nombre, limit: 50, null:false
      t.datetime :fechacre
      t.datetime :fechacam
      t.varchar :usuario, limit: 15, null:false
    end
    execute <<-SQL
    ALTER TABLE plans
      ADD CONSTRAINT DF_plans_fechacre  
      DEFAULT (getdate()) FOR fechacre
    ALTER TABLE plans
      ADD CONSTRAINT DF_plans_fechacam  
      DEFAULT (getdate()) FOR fechacam
    SQL
  end

  def down
    execute <<-SQL
    ALTER TABLE plans
      DROP CONSTRAINT DF_plans_fechacre
    ALTER TABLE plans
      DROP CONSTRAINT DF_plans_fechacam
    SQL
    drop_table :plans
  end


end
