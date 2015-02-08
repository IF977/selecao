class CreateExperienciaDocencia < ActiveRecord::Migration
  def change
    create_table :experiencia_docencia do |t|
      t.float :tempo_terceiro_grau
      t.float :tempo_monitoria
      t.references :inscricao, index: true

      t.timestamps null: false
    end
    add_foreign_key :experiencia_docencia, :inscricaos
  end
end
