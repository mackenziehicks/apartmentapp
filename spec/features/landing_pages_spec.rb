require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do

  context 'Going to website' do
    Steps 'Listing Apartments' do
      Given 'I am on the landing page' do
        visit '/'
      end #end of Given
      Then 'I can see the Apartments Listing Page' do
        expect(page).to have_content("Listing Apartments")
      end #end of THEN
    end #end of Steps
  end #end of context

  context 'Creating an Apartment' do
    Steps 'Listing Apartments' do
      Given 'I am on the landing page' do
        visit '/'
      end #end of Given
      Then 'I can see the Apartments Listing Page' do
        expect(page).to have_content("Listing Apartments")
      end #end of THEN
      And 'I can click on "New Apartment"' do
       click_link('New Apartment')
     end #end of AND
     And "I'm taken to a page where I can create a new Apartment" do
      fill_in('Address 1', :with =>'3803 Ray Street')
      fill_in('Address 2', :with =>'apt 2')
      fill_in('City', :with => 'San Diego')
      fill_in('Postal code', :with => '92104')
      fill_in('State', :with => 'CA')
      fill_in('Country', :with => 'USA')
      click_button('Create Apartment')
    end #end of And
    Then "I'm taken to a page that has all the info and tells us the apartment was created" do
      expect(page).to have_content('Apartment was successfully created.')
      expect(page).to have_content('3803 Ray Street')
      expect(page).to have_content('apt 2')
      expect(page).to have_content('San Diego')
      expect(page).to have_content('92104')
      expect(page).to have_content('CA')
      expect(page).to have_content('USA')
    end
    end #end of Steps
  end #end of context









end #end of Rspec
