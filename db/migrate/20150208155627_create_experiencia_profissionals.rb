class CreateExperienciaProfissionals < ActiveRecord::Migration
  def change
    create_table :experiencia_profissionals do |t|
      t.float :tempo_chefia
      t.float :tempo_nivel_superior
      t.float :tempo_nivel_medio
      t.float :tempo_sem_vinculo
      t.float :tempo_estagio
      t.references :inscricao, index: true

      t.timestamps null: false
    end
    add_foreign_key :experiencia_profissionals, :inscricaos
  end
end
