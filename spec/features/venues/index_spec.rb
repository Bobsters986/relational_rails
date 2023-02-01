require 'rails_helper'

RSpec.describe "Venues Index Page", type: :feature do
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  let!(:venue_1) { Venue.create!(decible_limit: true, rank:1, name: "Red Rocks") }
  let!(:venue_2) { Venue.create!(decible_limit: false, rank:2, name: "Mission Ballroom") }
  let!(:venue_3) { Venue.create!(decible_limit: false, rank:5, name: "Ball Arena") }

  describe "As a visitor" do
    describe "when I visit '/venues' " do
      it "I see the name of each parent record in the system" do

        visit '/venues'
        # save_and_open_page
        
        expect(page).to have_content(venue_1.name)
        expect(page).to have_content(venue_2.name)
        expect(page).to have_content(venue_3.name)
      end
    end
  end
end