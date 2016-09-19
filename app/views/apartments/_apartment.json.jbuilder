json.extract! apartment, :id, :address_1, :address_2, :city, :postal_code, :state, :country, :created_at, :updated_at
json.url apartment_url(apartment, format: :json)