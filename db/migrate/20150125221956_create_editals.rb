class CreateEditals < ActiveRecord::Migration
  def change
    create_table :editals do |t|
      t.string :numero
      t.string :descricao
      t.date :data_publicacao
      t.binary :arquivo

      t.timestamps null: false
    end
  end
end
