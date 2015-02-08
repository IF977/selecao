class CreateExperienciaPdis < ActiveRecord::Migration
  def change
    create_table :experiencia_pdis do |t|
      t.float :tempo_iniciacao
      t.float :tempo_pdi
      t.references :inscricao, index: true

      t.timestamps null: false
    end
    add_foreign_key :experiencia_pdis, :inscricaos
  end
end
