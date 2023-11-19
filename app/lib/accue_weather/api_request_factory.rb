module AccueWeather
	class APIRequestFactory
		def uniq_id(city)
			generic_request_merge(
				{
					q: city
					offset: false,
					allias: false
				}
			)
		end

		private

		def generic_request
			{
				apikey: ENV.fetch('ACCUE_WEATHER_API_KEY'),
				language: 'en',
				detalis: false
			}
		end
	end
end