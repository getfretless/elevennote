json.array!(@notes) do |note|
  # json.extract! note, :id, :title, :body_text, :body_html, :created_at, :updated_at
  json.id note.id
  json.title note.title
  json.url api_v1_note_url(note, format: :json, api_key: params[:api_key])
end
