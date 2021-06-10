require 'json_reader'
require 'booking_service'

class PropertyRepository
  Property = Struct.new(:id, :title)

  def initialize(source:)
    @source = source
  end

  def all
    source
      .read
      .map{|obj| Property.new(obj["id"], obj["title"])}
  end

  private

  attr_reader :source
end
