class CreateEventosCalendarios < ActiveRecord::Migration
  def change
    create_table :eventos_calendarios do |t|
      t.date :data_inicial
      t.date :data_final
      t.string :observacao
      t.references :evento, index: true
      t.references :calendario, index: true

      t.timestamps null: false
    end
    add_foreign_key :eventos_calendarios, :eventos
    add_foreign_key :eventos_calendarios, :calendarios
  end
end
