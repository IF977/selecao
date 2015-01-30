json.array!(@editals) do |edital|
  json.extract! edital, :id, :numero, :descricao, :data_publicacao, :arquivo
  json.url edital_url(edital, format: :json)
end
