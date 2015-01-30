class CreateProcessoSeletivos < ActiveRecord::Migration
  def change
    create_table :processo_seletivos do |t|
      t.string :descricao
      t.references :edital, index: true
      #t.references :calendario, index: true

      t.timestamps null: false
    end
    add_foreign_key :processo_seletivos, :editals
    #add_foreign_key :processo_seletivos, :calendario
  end
end
