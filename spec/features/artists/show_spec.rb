require 'rails_helper'

RSpec.describe "Artists Show Page", type: :feature do
  
  let!(:venue_1) { Venue.create!(decible_limit: true, rank:1, name: "Red Rocks") }
  let!(:venue_2) { Venue.create!(decible_limit: false, rank:2, name: "Mission Ballroom") }
  let!(:venue_3) { Venue.create!(decible_limit: false, rank:5, name: "Ball Arena") }

  let!(:artist_1) { Artist.create!(full_band: true, cost: 60, name: "STS9", venue: venue_1) }
  let!(:artist_2) { Artist.create!(full_band: true, cost: 65, name: "Umphrey's McGee", venue: venue_1) }
  let!(:artist_3) { Artist.create!(full_band: true, cost: 55, name: "Brit Floyd", venue: venue_1) }
  let!(:artist_4) { Artist.create!(full_band: false, cost: 63, name: "Pretty Lights", venue: venue_1) }

  describe "As a visitor" do
    describe "when I visit '/artists/:id' " do
      it "4. I see the child with that id including the child's attributes" do
        visit "/artists/#{artist_1.id}"
        
        expect(page).to have_content(artist_1.name)
        expect(page).to have_content(artist_1.full_band)
        expect(page).to have_content(artist_1.cost)
        expect(page).to have_content(artist_1.id)
        expect(page).to have_content(artist_1.created_at)
        expect(page).to have_content(artist_1.updated_at)
        expect(page).to have_content(artist_1.venue_id)
        expect(page).to_not have_content(artist_2.id)
        expect(page).to_not have_content(artist_3.name)
        expect(page).to_not have_content(artist_4.cost)
      end
    end

    describe "when I visit any page on the site" do
      it "9. I see a link at the top of the page that takes me to the Parent Index" do
        visit '/artists'

        click_link('All Venues')

        expect(current_path).to eq('/venues')
        expect(page).to have_content(venue_1.name)
        expect(page).to have_content(venue_2.name)
        expect(page).to have_content(venue_3.name)
      end
    end
  end
end