class DarkskyService
  def get_forecast(latitude, longitude)
    conn = Faraday.new("https://api.darksky.net/forecast/8fe83b28502ceb642f504597ba13bb26/39.7392358,-104.990251") do |f|
      f.adapter Faraday.default_adapter
    end

    response = conn.get
    results = JSON.parse(response.body, symbolize_names: true)
# binding.pry
  end
end

# results[:currently]
#                   [:time] unixtime 1559425534 (seconds since '0000' on Thursday, Jan 1, 1970) UCT (date and time), summary- ruby Time.at(uct)
#                   [:summary] "Mostly Cloudy" summary
#                   [:icon] "partly-cloudy-day" summary(condition)
#                   [:temperature] 66.7 summary
#                   [:apparentTemperature] 66 details
#         [:daily] FOR TODAY
#                   [:summary] "Mostly cloudy through today..."
#                   tonight summary?
#                   [:icon] 'rain'
#                   [:data][0][:temperatureHigh] summary(first hash in array of hashes is today)
#                   [:data][0][:temperatureLow] summary
#                   [:data][0][:uvIndex] details
#                   [:data][0][:humidity] details
#                   [:data][0][:visibility] details
#
#         PART 3:
#         HOURLY FOR TODAY: 8 hours
#         [:hourly][:data][0]
#                           [:time] 11PM
#                           [:temperature]
#                           [:icon] string
#
#         EACH DAY OF WEEK: 5 days
#         [:daily] - array of hashes, each hash is one day's info limit to 5 days
#                 [:data][:summary]
#                 [:data][:icon]
#                 [:data][0][:humidity]
#                 [:data][0][:temperatureHigh]
#                 [:data][0][:temperatureLow]
#                 [:data][0][:time]- to return day of the week
