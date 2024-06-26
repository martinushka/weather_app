# frozen_string_literal: true
module V1
		class Weather < Grape::API
		CITY = 'miami'

		before do
			def client
				@client ||= ::AccueWeather::Client.new('weather app')
			end

			def uniq_id
				@uniq_id ||= client.uniq_id(city: CITY).uniq_id
			end

		end

			resource :weather do
				desc 'get current temperature'
				get '/current' do
					result = client.current_temperature(uniq_id: uniq_id)

					present '200'
				end

			namespace :historical do
				desc 'hourly temperature for the last 24 hours'
				get '/' do
					result = client.historical_temperature(uniq_id: uniq_id)

					present result.temperature_24_hours
				end

				desc 'maximum temperature in 24 hours'
				get '/max' do
					result = client.historical_temperature(uniq_id: uniq_id)

					present result.max_temp_in_24_hours
				end

				desc 'minimum temperature in 24 hours'
				get '/min' do
					result = client.historical_temperature(uniq_id: uniq_id)

					present result.min_temp_in_24_hours
				end

				desc 'average temperature in 24 hours'
				get '/avg' do
					result = client.historical_temperature(uniq_id: uniq_id)

					present result.avg_temp_in_24_hours
				end
			end
		end
	end
end