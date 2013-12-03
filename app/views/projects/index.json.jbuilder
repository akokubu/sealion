json.array!(@projects) do |project|
  json.extract! project, :title, :description, :parent_id
  json.url project_url(project, format: :json)
end
