json.extract! bill, :id, :amount, :tax, :total, :issue_id, :created_at, :updated_at
json.url bill_url(bill, format: :json)
