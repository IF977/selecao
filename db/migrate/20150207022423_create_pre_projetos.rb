class CreatePreProjetos < ActiveRecord::Migration
  def change
    create_table :pre_projetos do |t|
      t.references :inscricao, index: true
      t.float :aderencia
      t.float :alinhamento
      t.float :contextualizacao
      t.float :consistencia
      t.float :autonomia_intelectual
      t.float :nota_final

      t.timestamps null: false
    end
    add_foreign_key :pre_projetos, :inscricaos
  end
end
