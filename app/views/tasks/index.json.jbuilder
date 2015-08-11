json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :status, :notes, :due_date, :start_date
  json.url task_url(task, format: :json)
end
