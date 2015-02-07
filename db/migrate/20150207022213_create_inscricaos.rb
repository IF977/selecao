class CreateInscricaos < ActiveRecord::Migration
  def change
    create_table :inscricaos do |t|
      t.referneces :user
      t.references :linha_pesquisa, index: true
      t.references :processo_seletivo, index: true

      t.timestamps null: false
    end
    add_foreign_key :inscricaos, :linha_pesquisas
    add_foreign_key :inscricaos, :processo_seletivos
  end
end
