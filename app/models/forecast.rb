class Forecast
  attr_reader :id,
              :currently,
              :today,
              :daily,
              :hourly

  def initialize(data)
    @id = 1
    @currently = data[:currently]
    @today = data[:daily]
    @hourly = data[:hourly][:data]
    @daily = data[:daily][:data]
  end

  def currently
    {
      time: Time.at(@currently[:time]),
      summary: @currently[:summary],
      icon: @currently[:icon],
      termperature: @currently[:temperature],
      feels_like: @currently[:apparentTemperature]
    }
  end

  def today
    {
      summary: @today[:summary],
      icon: @today[:icon],
      high: @today[:data][0][:temperatureHigh],
      low: @today[:data][0][:temperatureLow],
      uv_index: @today[:data][0][:uvIndex],
      visibility: @today[:data][0][:visibility],
      humidity: @today[:data][0][:humidity]
    }
  end

  def hourly
    @hourly.map do |by_hour|
      {
        time: Time.at(by_hour[:time]),
        temperature: by_hour[:temperature],
        icon: by_hour[:icon]
      }
    end
  end

  def daily
    @daily.map do |by_day|
      {
        icon: by_day[:icon],
        humidity: by_day[:humidity],
        high: by_day[:temperatureHigh],
        low: by_day[:temperatureLow],
        time: Time.at(by_day[:time])
      }
    end
  end
end
