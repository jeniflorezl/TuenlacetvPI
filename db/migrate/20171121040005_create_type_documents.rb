class CreateTypeDocuments < ActiveRecord::Migration[5.1]
  def up
    create_table :type_documents do |t|
      t.varchar :nombre, limit: 50, null:false
      t.datetime :fechacre
      t.datetime :fechacam
      t.varchar :usuario, limit: 15, null:false
    end
    execute <<-SQL
    ALTER TABLE type_documents
      ADD CONSTRAINT DF_type_documents_fechacre  
      DEFAULT (getdate()) FOR fechacre
    ALTER TABLE type_documents
      ADD CONSTRAINT DF_type_documents_fechacam  
      DEFAULT (getdate()) FOR fechacam
    SQL
  end

  def down
    execute <<-SQL
    ALTER TABLE type_documents
      DROP CONSTRAINT DF_type_documents_fechacre
    ALTER TABLE type_documents
      DROP CONSTRAINT DF_type_documents_fechacam
    SQL
    drop_table :type_documents
  end


  def change
    create_table :type_documents do |t|

      t.timestamps
    end
  end
end
