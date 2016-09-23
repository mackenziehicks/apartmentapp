class Apartment < ActiveRecord::Base
  belongs_to :user
  geocoded_by :full_address
  after_validation :geocode
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :user, presence: true
  validates :address_1, :city, :state, :postal_code, length: {minimum: 2}
  resourcify

  def full_address
    @full_address = address_1 + " " + address_2 + " " + city + " " + state + " " + postal_code.to_s + " " + country
  end


end
