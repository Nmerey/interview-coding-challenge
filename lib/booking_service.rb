class BookingService
	def initialize(property, events)
		@property = property
		@events = events
	end

	def bookings
		@events.filter{ |event| event.data["property_id"] == @property.id }
	end

	def booking_id
		if !self.bookings.empty?
			self.bookings.first.data["booking_id"]
		end
	end

	def property_events
		@events.filter{ |event| event.data["booking_id"] == self.booking_id }
	end
	
	def check_status
		self.property_events.empty? || self.property_events.last.type == "BookingCheckedOut" ? "empty" : "occupied"
	end
end