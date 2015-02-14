class CreateAvaliacaoPreProjetos < ActiveRecord::Migration
  def change
    create_table :avaliacao_pre_projetos do |t|
      t.references :user, index: true
      t.references :inscricao, index: true
      t.float :aderencia
      t.float :alinhamento
      t.float :contextualizacao
      t.float :redacao
      t.float :autonomia

      t.timestamps null: false
    end
    add_foreign_key :avaliacao_pre_projetos, :users
    add_foreign_key :avaliacao_pre_projetos, :inscricaos
  end
end
