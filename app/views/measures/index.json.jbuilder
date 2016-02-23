json.array!(@measures) do |measure|
  json.extract! measure, :id, :temperature, :humidity, :created_at
end
