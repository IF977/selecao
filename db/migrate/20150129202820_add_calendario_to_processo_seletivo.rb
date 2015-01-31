class AddCalendarioToProcessoSeletivo < ActiveRecord::Migration
  def change
    #add_reference :processo_seletivos, :calendarios, index: true
    #add_foreign_key :processo_seletivos, :calendarios
  end
end
