class AddColumnAvaliacaoPreProjeto < ActiveRecord::Migration
  def change
    add_column :avaliacao_pre_projetos, :consistencia, :float
  end
end