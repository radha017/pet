json.extract! animal, :id, :name, :species, :breed, :age, :description, :is_adopted, :user_id, :created_at, :updated_at
json.url animal_url(animal, format: :json)
