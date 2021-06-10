require 'repositories/property_repository'
require 'repositories/event_repository'
require 'booking_service'
require 'byebug'

RSpec.describe BookingService do
	let(:properties) { PropertyRepository.new(source: JsonReader.new('data/properties.json', 'properties')).all }
	let(:events) { EventRepository.new(source: JsonReader.new('data/events.json', 'events')).all }
	let(:booking_first) { BookingService.new( properties.first, events ) }
	let(:booking_last) { BookingService.new( properties.last , events ) }

	it "should return all events related to property" do
		expect(booking_first.property_events).to eq(events.filter{ |event| event.data["booking_id"] == "aaa" })
	end
	
	it "should return status of property" do
		expect(booking_first.check_status).to eq('empty')
		expect(booking_last.check_status).to eq('empty')
	end
end