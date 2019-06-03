# require 'rails_helper'
#
# describe Forecast, type: :model do
#   it 'has attributes' do
#     attributes = {
#       id: 1,
#       currently: {
#             time: "2019-06-03T06:41:08.000-06:00",
#             summary: "Drizzle",
#             icon: "rain",
#             temperature: 59.19,
#             feels_like: 59.19
#         },
#         today: {
#             summary: "Light rain today and tomorrow, with high temperatures peaking at 85F on Friday.",
#             icon: "rain",
#             high: 81.31,
#             low: 54.4,
#             uv_index: 9,
#             visibility: 7.46,
#             humidity: 0.42
#         },
#         daily: [
#             {
#                 icon: "fog",
#                 humidity: 0.42,
#                 high: 81.31,
#                 low: 54.4,
#                 time: "2019-06-03T00:00:00.000-06:00"
#             }
#         ],
#         hourly: [
#           {
#                 time: "2019-06-03T06:00:00.000-06:00",
#                  temperature: 56.62,
#                  icon: "fog"
#           }
#         ]
#     }
#     forecast = Forecast.new(attributes)
#
#     expect(forecast.id).to eq(attributes[:id])
#   end
#
#   describe 'instance methods' do
#   end
# end
