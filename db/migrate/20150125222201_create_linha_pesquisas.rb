class CreateLinhaPesquisas < ActiveRecord::Migration
  def change
    create_table :linha_pesquisas do |t|
      t.string :descricao
      t.references :edital, index: true

      t.timestamps null: false
    end
    add_foreign_key :linha_pesquisas, :editals
  end
end
