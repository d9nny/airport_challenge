require_relative 'weather'
require_relative 'plane'

class Airport
	DEFAULT_CAPACITY = 10

	def initialize(capacity = DEFAULT_CAPACITY, weather: Weather.new)
		@capacity = capacity
		@planes = []
		@weather = weather
	end

	def land plane
		raise 'Plane is not flying' if !plane.flying?
		raise 'Airport is full' if full?
		raise 'Too stormy to land' if stormy_weather?
		plane.land
		planes << plane
	end

	def take_off plane
		raise 'Plane is currently flying' if plane.flying?
		raise 'Too stormy to take off' if stormy_weather?
		planes.delete plane if planes.include? plane 
		plane.take_off
	end

	private

	attr_reader :planes, :capacity, :weather
			
		def full?
    	planes.count >= capacity
    end

  	def stormy_weather? 
  		weather.stormy? == true
  	end
end
