class CreateCidades < ActiveRecord::Migration
  def change
    create_table :cidades do |t|
      t.string :nome
      t.references :estado, index: true

      t.timestamps null: false
    end
    add_foreign_key :cidades, :estados
  end
end
