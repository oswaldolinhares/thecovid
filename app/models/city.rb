# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :state
  before_save :find_coordinates

  def coordinates
    "#{latitude},#{longitude},30mi"
  end

  private

  def find_coordinates
    coordinates = Geocoder.search(name).first.coordinates
    self.latitude = coordinates.first
    self.longitude = coordinates.last
  end
end
