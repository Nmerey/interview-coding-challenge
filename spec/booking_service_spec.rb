require 'repositories/property_repository'
require 'repositories/event_repository'
require 'booking_service'
RSpec.describe BookingService do
	let(:properties) { PropertyRepository.new(source: JsonReader.new('data/properties.json', 'properties')) }
	let(:events) { EventRepository.new(source: JsonReader.new('data/events.json', 'events')) }
	let(:booking_first) { BookingService.new( properties.first, events ) }
	let(:booking_last) { BookingService.new( properties.last, events ) }


	it "should return status of property" do
		expect(booking_first.check_status).to eq('empty')
		expect(booking_last.check_status).to eq('occupied')
	end
end