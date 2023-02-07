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
        
        expect(page).to have_content(artist_1.name)
        expect(page).to have_content(artist_2.full_band)
        expect(page).to have_content(artist_3.cost)
        expect(page).to have_content(artist_1.id)
        expect(page).to have_content(artist_2.created_at)
        expect(page).to have_content(artist_3.updated_at)
        expect(page).to have_content(artist_1.venue_id)
        expect(page).to have_content(artist_2.venue_id)
      end

      it '15. it will only show artist records if they are a full band/boolean true' do
        visit '/artists'
        
        expect(page).to have_content(artist_1.name)
        expect(page).to have_content(artist_2.name)
        expect(page).to have_content(artist_3.name)
        expect(page).to have_content(artist_4.name)
        expect(page).to have_link '86 the DJs'

        click_link '86 the DJs'

        expect(page).to have_content(artist_1.name)
        expect(page).to have_content(artist_2.name)
        expect(page).to have_content(artist_3.name)
        expect(page).to_not have_content(artist_4.name)
        expect(current_path).to eq('/artists')
      end

      it '18. I see a link to edit that childs info, next to every child' do
        visit '/artists'

        expect(page).to have_link("Update #{artist_1.name}")
        expect(page).to have_link("Update #{artist_2.name}")
        expect(page).to have_link("Update #{artist_3.name}")
      end

      it '18. When I click the link, I should be taken to that childs edit page where I can update its information' do
        visit '/artists'

        click_link "Update #{artist_3.name}"

        expect(current_path).to eq("/artists/#{artist_3.id}/edit")
      end

      it '23. Next to each artist, I see a link to delete that artist' do
        visit '/artists'

        expect(page).to have_link "Delete #{artist_1.name}"
        expect(page).to have_link "Delete #{artist_2.name}"
        expect(page).to have_link "Delete #{artist_3.name}"
      end

      it '23. When I click the link, that artist is deleted, and I am re routed to the artist index page where that record is no longer there' do
        visit '/artists'

        click_link "Delete #{artist_2.name}"
        click_link "Delete #{artist_3.name}"

        expect(current_path).to eq('/artists')
        expect(page).to have_content(artist_1.name)
        expect(page).to have_content(artist_4.name)
        expect(page).to_not have_content(artist_2.name)
        expect(page).to_not have_content(artist_3.name)
      end
    end
  end
end