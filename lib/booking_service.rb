class BookingService
	def initialize(property, events)
		@property = property
		@events = events
	end

	def check_status
		last_event = @events.filter{ |event| event.data.property_id == @property.id }.sort_by { |event| event.created_at }.last
		if last_event
			true
		end
	end
end