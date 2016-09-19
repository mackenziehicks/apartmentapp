class Apartment < ActiveRecord::Base
  belongs_to :owner
  geocoded_by :full_address
  after_validation :geocode


  def full_address
    @full_address = address_1 + " " + address_2 + " " + city + " " + state + " " + postal_code.to_s + " " + country
  end


end
