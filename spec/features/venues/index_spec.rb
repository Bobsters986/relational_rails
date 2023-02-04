require 'rails_helper'

RSpec.describe "Venues Index Page", type: :feature do
  
  let!(:venue_1) { Venue.create!(decible_limit: true, rank:1, name: "Red Rocks", created_at: Time.now - 1.hour) }
  let!(:venue_2) { Venue.create!(decible_limit: false, rank:2, name: "Mission Ballroom", created_at: Time.now - 2.hour) }
  let!(:venue_3) { Venue.create!(decible_limit: false, rank:5, name: "Ball Arena") }

  describe "As a visitor" do
    describe "when I visit '/venues' " do
      it "1. I see the name of each parent record in the system" do

        visit '/venues'
        # save_and_open_page
        
        expect(page).to have_content(venue_1.name)
        expect(page).to have_content(venue_2.name)
        expect(page).to have_content(venue_3.name)
      end

      it "6. I see that records are ordered by most recently created first" do

        visit '/venues'
        # save_and_open_page
        
        expect(page).to have_content(venue_1.created_at)
        expect(page).to have_content(venue_2.created_at)
        expect(page).to have_content(venue_3.created_at)
        expect(venue_1.name).to appear_before(venue_2.name)
        expect(venue_3.name).to appear_before(venue_1.name)
      end
    end
  end
end