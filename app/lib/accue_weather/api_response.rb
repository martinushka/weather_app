module AccueWeather
	class APIResponse
		include ApplicationHelper

		attr_accessor :response

		def initialize(response)
			@response = response
		end

		def uniq_id
			@uniq_id ||= get_nested_value(response, key 'key')
		end
	end
end