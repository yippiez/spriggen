
module Viu

	# https://stackoverflow.com/questions/2108727/which-in-ruby-checking-if-program-exists-in-path-from-ruby
	private
	def self.which(cmd)
	  exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
	  ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
	    exts.each do |ext|
	      exe = File.join(path, "#{cmd}#{ext}")
	      return exe if File.executable?(exe) && !File.directory?(exe)
	    end
	  end
	  nil
	end

	public
	def self.is_avaible?
		self.which("viu") != nil
	end

	def self.display_image(image_path)
		%x("viu #{image_path}")
	end

	def self.display_rgb_array(rgb_array)
		# convert rgb array into tmp file
		# execute display image on tmp file
		# delete tmp file
	end
	
end

puts Viu.is_avaible?
