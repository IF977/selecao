class CreateProducaoCientificas < ActiveRecord::Migration
  def change
    create_table :producao_cientificas do |t|
      t.string :nome
      t.string :indice_publicacao
      t.boolean :primeiro_autor
      t.string :tipo_producao
      t.references :inscricao, index: true

      t.timestamps null: false
    end
    add_foreign_key :producao_cientificas, :inscricaos
  end
end
