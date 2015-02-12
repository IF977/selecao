json.array!(@producao_cientificas) do |producao_cientifica|
  json.extract! producao_cientifica, :id, :nome, :indice_publicacao, :primeiro_autor, :tipo_producao, :inscricao_id
  json.url producao_cientifica_url(producao_cientifica, format: :json)
end
