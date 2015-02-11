json.array!(@avaliacao_curriculos) do |avaliacao_curriculo|
  json.extract! avaliacao_curriculo, :id, :nota_historicos, :nota_producao_cientifica, :nota_experiencia_docente, :nota_experiencia_pdi, :nota_experiencia_profissional, :user_id, :inscricao_id
  json.url avaliacao_curriculo_url(avaliacao_curriculo, format: :json)
end
