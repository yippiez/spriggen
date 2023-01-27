#!/usr/bin/env ruby

require "tco"

conf = Tco.config
conf.names["purple"] = "#622e90"
conf.names["dark-blue"] = "#2d3091"
conf.names["blue"] = "#00aaea"
conf.names["green"] = "#02a552"
conf.names["yellow"] = "#fdea22"
conf.names["orange"] = "#f37f5a"
conf.names["red"] = "#eb443b"
Tco.reconfigure conf

module Terminal
	@supported_types = ["RGB", "HEX", "GRAY"]

	private
	
    def self.out(image)
    	image.each do |row|
        	puts row.map { |c| ".".bg c }.join ""
        end
    end

    public

    def self.hex_to_rgb(image)
    end

    def self.gray_to_rgb(image)
    	image.map { |row| row.map { |el| [el,el,el]}}
    end
    
	def self.show_image(image, image_type="RGB")
		raise TypeError  unless @supported_types.include? image_type

		case image_type
			when "RGB"
				out(image)
			when "GRAY"
				out(gray_to_rgb(image))
		end
	end
end

# puts Terminal.gray_to_rgb([[1,2,3]]).to_s
grad = [[105] * 60, [60]*15]
Terminal.show_image(grad, "GRAY")
