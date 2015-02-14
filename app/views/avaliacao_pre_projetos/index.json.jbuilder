json.array!(@avaliacao_pre_projetos) do |avaliacao_pre_projeto|
  json.extract! avaliacao_pre_projeto, :id, :user_id, :inscricao_id, :aderencia, :alinhamento, :contextualizacao, :redacao, :autonomia
  json.url avaliacao_pre_projeto_url(avaliacao_pre_projeto, format: :json)
end
