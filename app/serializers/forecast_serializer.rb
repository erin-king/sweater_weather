class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :currently, :today, :daily, :hourly

end
