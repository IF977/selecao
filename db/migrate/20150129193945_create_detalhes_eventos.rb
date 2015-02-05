class CreateDetalhesEventos < ActiveRecord::Migration
  def change
    create_table :detalhes_eventos do |t|
      t.date :data_inicial
      t.date :data_final
      t.string :observacao
      t.references :evento, index: true
      t.references :processo_seletivo, index: true

      t.timestamps null: false
    end
    add_foreign_key :detalhes_eventos, :eventos
    add_foreign_key :detalhes_eventos, :processo_seletivos
  end
end
