require 'rails_helper'

RSpec.describe "Artists Index Page", type: :feature do
  
  let!(:venue_1) { Venue.create!(decible_limit: true, rank:1, name: "Red Rocks") }
  let!(:artist_1) { Artist.create!(full_band: true, cost: 60, name: "STS9", venue: venue_1) }
  let!(:artist_2) { Artist.create!(full_band: true, cost: 65, name: "Umphrey's McGee", venue: venue_1) }
  let!(:artist_3) { Artist.create!(full_band: true, cost: 55, name: "Brit Floyd", venue: venue_1) }
  let!(:artist_4) { Artist.create!(full_band: false, cost: 60, name: "Pretty Lights", venue: venue_1) }

  describe "As a visitor" do
    describe "when I visit '/artists' " do
      it "3. I see each Child in the system including the Child's attributes" do

        visit '/artists'
        # save_and_open_page
        
        expect(page).to have_content(artist_1.name)
        expect(page).to have_content(artist_2.full_band)
        expect(page).to have_content(artist_3.cost)
        expect(page).to have_content(artist_4.id)
        expect(page).to have_content(artist_1.created_at)
        expect(page).to have_content(artist_2.updated_at)
        expect(page).to have_content(artist_3.venue_id)
        expect(page).to have_content(artist_4.venue_id)
      end
    end
  end
end