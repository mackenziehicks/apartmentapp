json.extract! owner, :id, :name, :time, :phone, :address_id, :created_at, :updated_at
json.url owner_url(owner, format: :json)