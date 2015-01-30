class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :descricao

      t.timestamps null: false
    end
  end
end
