require 'rails_helper'

RSpec.feature "MapOfAllApartments", type: :feature do
  context 'Map of all listed apartments on homepage' do
    Steps 'Listing Apartments' do
      Given 'I am on the landing page' do
        visit '/'
      end #end of Given
      Then 'I can see the a map with all apartments listed' do
        expect(page).to find('#map')
      end #end of THEN
    end #end of Steps
  end #end of context



end
