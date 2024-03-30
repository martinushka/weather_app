module AccueWeather
	class APIResponse
		include ApplicationHelper

		attr_accessor :response

		def initialize(response)
			@response = response
		end

		def uniq_id
			@uniq_id ||= get_nested_value(response, key: 'key')
		end

		def weather_text
			@weather_text ||= get_nested_value(response, key: 'WeatherText')
		end

		def temperature
			@temperature ||= get_nested_value(response, key: 'Metric')
		end

		def temperature_24_hours
		  hash = {}

		  response[:body].each do |v|
		    key = Time.at(v['EpochTime']).to_datetime

		    # Проверяем, существует ли ключ 'Temperature' и 'Metric' в объекте v
		    if v['Temperature'] && v['Temperature']['Metric']
		      # Создаем новый хэш, если он не существует
		      hash[key] ||= {}
		      
		      # Добавляем значения в хэш для данного ключа
		      hash[key]['Value'] = v['Temperature']['Metric']['Value']
		      hash[key]['Unit'] = v['Temperature']['Metric']['Unit']
		      hash[key]['UnitType'] = v['Temperature']['Metric']['UnitType']
		      hash[key]['weather_text'] = weather_text
		    end
		  end

		  hash
		end


		def max_temp_in_24_hours
			temperature_24_hours.values.map {|x| x['Value']}.max
		end		

		def min_temp_in_24_hours
			temperature_24_hours.values.map {|x| x['Value']}.min
		end		

		def avg_temp_in_24_hours
			array = []

			temperature_24_hours.each_value do |x|
				array << x['Value']
			end

			(array.instance_eval {reduce(:+) / size.to_f}).round(2)
		end
	end
end