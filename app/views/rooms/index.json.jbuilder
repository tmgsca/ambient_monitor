json.array!(@rooms) do |room|
  json.id room.id
  json.name room.name
  json.measures do
      json.array!(room.measures) do |measure|
        json.id measure.id
        json.temperature measure.temperature
        json.humidity measure.humidity
      end
  end
end
