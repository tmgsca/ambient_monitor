class Measure < ActiveRecord::Base
  belongs_to :room

  def self.clean_old_measures(room)
    measures = Measure.where(created_at: 1.day.ago.beginning_of_day..1.day.ago.end_of_day, room: room)
    if measures.any?
      history = History.new
      history.avg_temperature = measures.average(:temperature).round(2)
      history.avg_humidity = measures.average(:humidity).round(2)
      history.max_temperature = measures.max_by(&:temperature).temperature.round(2)
      history.max_humidity = measures.max_by(&:humidity).humidity.round(2)
      history.min_temperature = measures.min_by(&:temperature).temperature.round(2)
      history.min_humidity = measures.min_by(&:humidity).humidity.round(2)
      history.room = room
      history.created_at = 1.day.ago.end_of_day
      if history.save
        measures.destroy_all
      end
    end
  end
end
