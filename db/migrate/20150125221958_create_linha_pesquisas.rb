class CreateLinhaPesquisas < ActiveRecord::Migration
  
  def change
    create_table (:linha_pesquisas) do |t|
      t.string :descricao

      t.timestamps null: false
    end
  end

end

