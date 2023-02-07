require 'rails_helper'

RSpec.describe "Venue Artists Index Page", type: :feature do
  
  let!(:venue_1) { Venue.create!(decible_limit: true, rank:1, name: "Red Rocks") }
  let!(:venue_2) { Venue.create!(decible_limit: false, rank:2, name: "Mission Ballroom") }

  let!(:artist_1) { Artist.create!(full_band: true, cost: 60, name: "STS9", venue: venue_1) }
  let!(:artist_2) { Artist.create!(full_band: true, cost: 65, name: "Umphrey's McGee", venue: venue_1) }
  let!(:artist_3) { Artist.create!(full_band: true, cost: 55, name: "Brit Floyd", venue: venue_1) }
  let!(:artist_5) { Artist.create!(full_band: true, cost: 70, name: "The String Cheese Incident", venue: venue_2) }

  describe "As a visitor" do
    describe "when I visit '/venues/:venue_id/artists' " do
      it "5. I see each Child that is associated with that Parent with each Child's attributes" do

        visit "/venues/#{venue_1.id}/artists"
        # save_and_open_page

        expect(page).to have_content(venue_1.name)
        expect(page).to have_content(artist_1.name)
        expect(page).to have_content(artist_2.name)
        expect(page).to have_content(artist_1.cost)
        expect(page).to have_content(artist_2.cost)
        expect(page).to_not have_content(artist_5.name)
        expect(page).to_not have_content(artist_5.cost)
      end

      it '16. has a link that when clicked will sort the venues artists alphabetically' do
        
        visit "/venues/#{venue_1.id}/artists"

        expect(artist_1.name).to appear_before(artist_3.name)
        expect(artist_2.name).to appear_before(artist_3.name)
        expect(page).to have_link 'Sort Alphabetically'

        click_link 'Sort Alphabetically'

        expect(artist_3.name).to appear_before(artist_1.name)
        expect(artist_1.name).to appear_before(artist_2.name)
        expect(current_path).to eq("/venues/#{venue_1.id}/artists")
      end

      it '18. I see a link to edit that childs info, next to every child' do
        visit "/venues/#{venue_1.id}/artists"

        expect(page).to have_link("Update #{artist_1.name}")
        expect(page).to have_link("Update #{artist_2.name}")
        expect(page).to have_link("Update #{artist_3.name}")
        expect(page).to_not have_link("Update #{artist_5.name}")
      end

      it '18. When I click the link, I should be taken to that childs edit page where I can update its information' do
        visit "/venues/#{venue_1.id}/artists"

        click_link "Update #{artist_1.name}"

        expect(current_path).to eq("/artists/#{artist_1.id}/edit")
      end
    end
  end
end