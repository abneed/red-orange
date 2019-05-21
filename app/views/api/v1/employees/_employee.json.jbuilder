json.extract! employee, :id, :name, :jobTitle, :subsidiary, :department, :currency, :phone, :dateOfHire, :created_at, :updated_at
json.url employee_url(employee, format: :json)
