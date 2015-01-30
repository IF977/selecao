json.array!(@pessoas) do |pessoa|
  json.extract! pessoa, :id, :nome, :cpf, :data_nascimento, :naturalidade, :nacionalidade, :estado_civil, :grau_formacao, :user_id
  json.url pessoa_url(pessoa, format: :json)
end
