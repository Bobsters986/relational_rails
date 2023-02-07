require 'rails_helper'

RSpec.describe "Destroying an Artist", type: :feature do
  
  let!(:venue_1) { Venue.create!(decible_limit: true, rank:1, name: "Red Rocks") }
  let!(:artist_1) { Artist.create!(full_band: true, cost: 60, name: "STS9", venue: venue_1) }
  let!(:artist_2) { Artist.create!(full_band: true, cost: 65, name: "Umphrey's McGee", venue: venue_1) }
  let!(:artist_3) { Artist.create!(full_band: true, cost: 55, name: "Brit Floyd", venue: venue_1) }

  describe "As a visitor" do
    describe "when I visit '/artists/:id' " do
      it '20. I see a link to delete that specific artist' do
        visit "/artists/#{artist_2.id}"

        expect(page).to have_link 'Delete Artist'
      end

      it '20. When I click the link, that artist is deleted, and I am re routed to the artist index page where that record is no longer there' do
        visit "/artists/#{artist_2.id}"
        
        click_link 'Delete Artist'

        expect(current_path).to eq('/artists')
        expect(page).to_not have_content(artist_2.name)
        expect(page).to have_content(artist_1.name)
        expect(page).to have_content(artist_3.name)
      end
    end
  end
end