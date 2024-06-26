module ApplicationHelper
	def get_nested_value(obj, key)
		if obj.respond_to?(:key) && obj.key?(key)
			obj[key]
		elsif obj.respond_to?(:each)
			res = nil
			obj.find { |*a| res = get_nested_value(a.last, key) }
		end
	end
end
