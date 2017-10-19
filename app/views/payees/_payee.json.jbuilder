json.extract! payee, :id, :name, :address, :acct_number, :status, :city, :state, :country, :post_code, :phone, :created_at, :updated_at
json.url payee_url(payee, format: :json)
