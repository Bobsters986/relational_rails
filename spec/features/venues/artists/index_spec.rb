require 'rails_helper'

RSpec.describe "Venue Artists Index Page", type: :feature do
  # As a visitor
  # When I visit '/venues/:venue_id/artists'
  # Then I see each Child that is associated with that Parent with each Child's attributes
  # (data from each column that is on the child table)
  let!(:venue_1) { Venue.create!(decible_limit: true, rank:1, name: "Red Rocks") }
  let!(:venue_2) { Venue.create!(decible_limit: false, rank:2, name: "Mission Ballroom") }

  let!(:artist_1) { Artist.create!(full_band: true, cost: 60, name: "STS9", venue: venue_1) }
  let!(:artist_2) { Artist.create!(full_band: true, cost: 65, name: "Umphrey's McGee", venue: venue_1) }
  let!(:artist_5) { Artist.create!(full_band: true, cost: 70, name: "The String Cheese Incident", venue: venue_2) }

  describe "As a visitor" do
    describe "when I visit '/venues/:venue_id/artists' " do
      it "I see each Child that is associated with that Parent with each Child's attributes" do

        visit "/venues/#{venue_1.id}/artists"
        save_and_open_page

        expect(page).to have_content(venue_1.name)
        expect(page).to have_content(artist_1.name)
        expect(page).to have_content(artist_2.name)
        expect(page).to have_content(artist_1.cost)
        expect(page).to have_content(artist_2.cost)
        expect(page).to_not have_content(artist_5.name)
        expect(page).to_not have_content(artist_5.cost)
      end
    end
  end
end