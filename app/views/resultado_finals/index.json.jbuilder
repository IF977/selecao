json.array!(@resultado_finals) do |resultado_final|
  json.extract! resultado_final, :id, :inscricao_id, :nota_final
  json.url resultado_final_url(resultado_final, format: :json)
end
