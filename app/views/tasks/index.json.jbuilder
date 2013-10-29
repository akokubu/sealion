json.array!(@tasks) do |task|
  json.extract! task, :title, :description, :complete
  json.url task_url(task, format: :json)
end
