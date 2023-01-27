
require 'tempfile'
require_relative './PIL'

include PIL

module Viu

	def is_avaible?
		self.which("viu") != nil
	end

	def display_rgb_array(rgb_array)
		file = Tempfile.new('image')
		numpy_array = rgb_array.map { |row| row.map { |pixel| pixel.reverse } }
		# numpy_array = numpy_array.transpose
		PIL::save_PIL_image(PIL::from_array_to_PIL_image(numpy_array), file.path)
		self.display_image(file.path)
	end

	private
	
	def display_image(image_path)
		system "viu #{image_path}"
	end

	def which(cmd)
	  # https://stackoverflow.com/questions/2108727/which-in-ruby-checking-if-program-exists-in-path-from-ruby
	  exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
	  ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
	    exts.each do |ext|
	      exe = File.join(path, "#{cmd}#{ext}")
	      return exe if File.executable?(exe) && !File.directory?(exe)
	    end
	  end
	  nil
	end
	
end
