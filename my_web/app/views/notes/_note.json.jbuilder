json.extract! note, :id, :genre, :title, :detail, :created_at, :updated_at
json.url note_url(note, format: :json)
