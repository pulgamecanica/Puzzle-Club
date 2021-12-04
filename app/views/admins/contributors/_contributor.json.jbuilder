json.extract! contributor, :id, :puzzle_id, :is_finished?, :created_at, :updated_at
json.url contributor_url(contributor, format: :json)
