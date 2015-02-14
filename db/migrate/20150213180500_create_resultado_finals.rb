class CreateResultadoFinals < ActiveRecord::Migration
  def change
    create_table :resultado_finals do |t|
      t.references :inscricao, index: true
      t.float :nota_final

      t.timestamps null: false
    end
    add_foreign_key :resultado_finals, :inscricaos
  end
end
