json.array!(@linha_pesquisas) do |linha_pesquisa|
  json.extract! linha_pesquisa, :id, :descricao
  json.url linha_pesquisa_url(linha_pesquisa, format: :json)
end
