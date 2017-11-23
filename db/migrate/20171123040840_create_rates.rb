class CreateRates < ActiveRecord::Migration[5.1]
  def up
    create_table :rates do |t|
      t.references :plan, foreign_key: true
      t.references :zone, foreign_key: true
      t.references :concept, foreign_key: true
      t.money :valor, null:false
      t.char :estado, limit: 1
      t.datetime :fechacre
      t.datetime :fechacam
      t.varchar :usuario, limit: 15, null:false
    end
    execute <<-SQL
    ALTER TABLE rates
      ADD CONSTRAINT DF_rates_fechacre  
      DEFAULT (getdate()) FOR fechacre
    ALTER TABLE rates
      ADD CONSTRAINT DF_rates_fechacam  
      DEFAULT (getdate()) FOR fechacam
    SQL
  end

  def down
    execute <<-SQL
    ALTER TABLE rates
      DROP CONSTRAINT DF_rates_fechacre
    ALTER TABLE rates
      DROP CONSTRAINT DF_rates_fechacam
    SQL
    drop_table :rates
  end

end
