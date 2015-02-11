class CidadesController < ApplicationController
  load_and_authorize_resource
  
  def cidades_por_estado
    estado_id = params[:id].to_i
    cidades = Cidade.where(:estado_id => estado_id)
    cty = []
    cidades.each do |cidade|
      cty << {:id => cidade.id, :n => cidade.nome}
    end
    render :json => {:cty => cty.compact}.as_json
  end

  
end
