class CreateAvaliacaoCurriculos < ActiveRecord::Migration
  def change
    create_table :avaliacao_curriculos do |t|
      t.float :nota_historicos
      t.float :nota_producao_cientifica
      t.float :nota_experiencia_docente
      t.float :nota_experiencia_pdi
      t.float :nota_experiencia_profissional
      t.references :user, index: true
      t.references :inscricao, index: true

      t.timestamps null: false
    end
    add_foreign_key :avaliacao_curriculos, :users
    add_foreign_key :avaliacao_curriculos, :inscricaos
  end
end
