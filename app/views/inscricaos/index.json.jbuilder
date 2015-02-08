json.array!(@inscricaos) do |inscricao|
  json.extract! inscricao, :id, :media_graduacao, :carga_horaria_graduacao, :tem_pos_graduacao, :graduacao_exterior, :media_mestrado, :tempo_curso_mestrado, :conceito_capes, :users_id, :processo_seletivos_linha_pesquisa_id
  json.url inscricao_url(inscricao, format: :json)
end
