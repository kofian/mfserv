json.extract! risk, :id, :description, :name, :location, :interest_rate, :situation, :amount_covered, :contribution, :created_at, :updated_at
json.url risk_url(risk, format: :json)
