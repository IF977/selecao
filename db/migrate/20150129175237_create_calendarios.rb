class CreateCalendarios < ActiveRecord::Migration
  def change
    create_table :calendarios do |t|
      t.references :processo_seletivo, index: true

      t.timestamps null: false
    end
    add_foreign_key :calendarios, :processos_seletivo
  end

end
