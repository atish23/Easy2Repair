json.extract! issue, :id, :device, :desc, :user_id, :type_of_problem, :delivery, :created_at, :updated_at
json.url issue_url(issue, format: :json)