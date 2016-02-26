json.array!(@rooms) do |room|
  json.id room.id
  json.name room.name
  json.max_winter_temp room.max_winter_temp
  json.min_winter_temp room.min_winter_temp
  json.max_summer_temp room.max_summer_temp
  json.min_summer_temp room.min_summer_temp
  json.max_winter_humidity room.max_winter_humidity
  json.min_winter_humidity room.min_winter_humidity
  json.max_summer_humidity room.max_summer_humidity
  json.min_summer_humidity room.min_summer_humidity
  json.measures do
      json.array!(room.measures) do |measure|
        json.id measure.id
        json.temperature measure.temperature
        json.humidity measure.humidity
      end
  end
end
