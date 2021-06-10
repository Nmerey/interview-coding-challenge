Dir["./lib/repositories/*.rb"].each {|file| require file }
Dir["./lib/*.rb"].each {|file| require file }

properties = PropertyRepository.new(source: JsonReader.new('data/properties.json', 'properties')).all
events = EventRepository.new(source: JsonReader.new('data/events.json', 'events')).all

class InitApp 
	Property = Struct.new(:id, :title, :status)

	def initialize(properties, events)
		@properties = properties
		@events = events
	end

	def print_all_properties
		prop_with_stats = @properties.map { |elem| Property.new(elem["id"], elem["title"], BookingService.new(elem,@events).check_status) }
		puts prop_with_stats
	end
end

InitApp.new(properties, events).print_all_properties

