json.extract! tournament, :id, :start_date, :end_date, :title, :created_at, :updated_at
json.url tournament_url(tournament, format: :json)
