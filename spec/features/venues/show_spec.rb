require 'rails_helper'

RSpec.describe "Venues Show Page", type: :feature do
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes
  # (data from each column that is on the parent table)
  let!(:venue_1) { Venue.create!(decible_limit: true, rank:1, name: "Red Rocks") }
  let!(:venue_2) { Venue.create!(decible_limit: false, rank:2, name: "Mission Ballroom") }
  let!(:venue_3) { Venue.create!(decible_limit: false, rank:5, name: "Ball Arena") }

  describe "As a visitor" do
    describe "when I visit '/venues/:id' " do
      it "I see the parent with that id including the parent's attributes" do

        visit "/venues/#{venue_1.id}" 
        save_and_open_page
        
        expect(page).to have_content(venue_1.name)
        expect(page).to have_content(venue_1.rank)
        expect(page).to have_content(venue_1.decible_limit)
        expect(page).to have_content(venue_1.created_at)
        expect(page).to have_content(venue_1.updated_at)
      end

      it "I see only the parent with that id including the parent's attributes" do

        visit "/venues/#{venue_1.id}" 
        save_and_open_page
        
        expect(page).to_not have_content(venue_2.name)
        expect(page).to_not have_content(venue_3.decible_limit)
      end
    end
  end
end