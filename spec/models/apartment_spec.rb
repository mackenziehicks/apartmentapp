require 'rails_helper'

RSpec.describe Apartment, type: :model do
  it "is a thing" do
    expect{Apartment.new}.to_not raise_error
  end


end
