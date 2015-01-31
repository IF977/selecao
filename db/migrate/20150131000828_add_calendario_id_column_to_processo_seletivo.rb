class AddCalendarioIdColumnToProcessoSeletivo < ActiveRecord::Migration
  def change
    add_column :processo_seletivos, :calendario_id, :integer
    add_foreign_key :processo_seletivos, :calendarios
  end
end
