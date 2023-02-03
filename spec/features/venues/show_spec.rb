require 'rails_helper'

RSpec.describe "Venues Show Page", type: :feature do
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes
  # (data from each column that is on the parent table)
  let!(:venue_1) { Venue.create!(decible_limit: true, rank:1, name: "Red Rocks") }
  let!(:venue_2) { Venue.create!(decible_limit: false, rank:2, name: "Mission Ballroom") }
  let!(:venue_3) { Venue.create!(decible_limit: false, rank:5, name: "Ball Arena") }

  let!(:artist_4) { Artist.create!(full_band: false, cost: 63, name: "Pretty Lights", venue: venue_1) }
  let!(:artist_5) { Artist.create!(full_band: true, cost: 70, name: "The String Cheese Incident", venue: venue_2) }
  let!(:artist_6) { Artist.create!(full_band: false, cost: 52, name: "Emancipator", venue: venue_2) }
  let!(:artist_7) { Artist.create!(full_band: true, cost: 75, name: "Billy Strings", venue: venue_2) }

  describe "As a visitor" do
    describe "when I visit '/venues/:id' " do
      it "2. I only see the parent with that id including the parent's attributes" do

        visit "/venues/#{venue_1.id}" 
        # save_and_open_page
        
        expect(page).to have_content(venue_1.id)
        expect(page).to have_content(venue_1.name)
        expect(page).to have_content(venue_1.rank)
        expect(page).to have_content(venue_1.decible_limit)
        expect(page).to have_content(venue_1.created_at)
        expect(page).to have_content(venue_1.updated_at)
        expect(page).to_not have_content(venue_2.name)
        expect(page).to_not have_content(venue_3.decible_limit)
      end

      it "7. I see a count of the number of children associated with this parent" do

        visit "/venues/#{venue_2.id}" 
        # save_and_open_page
        
        expect(page).to have_content(venue_2.name)
        expect(page).to have_content("Number of Associated Artists: #{venue_2.artist_count}")
        expect(venue_2.artist_count).to eq(3)
      end

      # it "I see only the parent with that id including the parent's attributes" do

      #   visit "/venues/#{venue_1.id}" 
      #   # save_and_open_page
        
      #   expect(page).to_not have_content(venue_2.name)
      #   expect(page).to_not have_content(venue_3.decible_limit)
      # end
    end
  end
end