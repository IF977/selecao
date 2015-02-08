class CreateInscricaos < ActiveRecord::Migration
  def change
    create_table :inscricaos do |t|
      t.float :media_graduacao
      t.integer :carga_horaria_graduacao
      t.boolean :tem_pos_graduacao
      t.boolean :graduacao_exterior
      t.float :media_mestrado
      t.integer :tempo_curso_mestrado
      t.string :conceito_capes
      t.references :users, index: true
      t.references :processo_seletivos_linha_pesquisa, index: true

      t.timestamps null: false
    end
    add_foreign_key :inscricaos, :users
    add_foreign_key :inscricaos, :processo_seletivos_linha_pesquisas
  end
end
