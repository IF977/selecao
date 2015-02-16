class AddColumnResultadoFinals < ActiveRecord::Migration
  def change
    add_column :resultado_finals, :aprovado, :boolean
  end
end