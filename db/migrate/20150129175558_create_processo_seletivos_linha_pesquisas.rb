class CreateProcessoSeletivosLinhaPesquisas < ActiveRecord::Migration
  def change
    create_table :processo_seletivos_linha_pesquisas do |t|
      t.integer :vagas
      
      t.references :processo_seletivo
      t.references :linha_pesquisa
    end
    add_index :processo_seletivos_linha_pesquisas, [:processo_seletivo_id, :linha_pesquisa_id], 
    		:unique => true, :name => 'index_processo_seletivos_linha_pesquisas'
  end
end