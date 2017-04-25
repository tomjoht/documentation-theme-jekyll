module Jekyll
	module ExpandNestedVariableFilter
		def flatify(input)
			if (!input.nil?) then
				input = input.to_s
				Liquid::Template.parse(input).render(@context)
			end
		end
	end
end

Liquid::Template.register_filter(Jekyll::ExpandNestedVariableFilter)
