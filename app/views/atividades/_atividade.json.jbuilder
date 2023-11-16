json.extract! atividade, :id, :nome, :data, :hora_inicio, :hora_final, :status, :created_at, :updated_at
json.url atividade_url(atividade, format: :json)
