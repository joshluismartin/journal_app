json.extract! task, :id, :title, :description, :due_date, :category, :references, :user_id, :completed, :created_at, :updated_at
json.url task_url(task, format: :json)
