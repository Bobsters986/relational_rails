require 'rails_helper'

RSpec.describe "Destroying a Venue", type: :feature do

  let!(:venue_1) { Venue.create!(decible_limit: true, rank:1, name: "Red Rocks") }
  let!(:venue_2) { Venue.create!(decible_limit: false, rank:2, name: "Mission Ballroom") }
  let!(:venue_3) { Venue.create!(decible_limit: false, rank:5, name: "Ball Arena") }

  describe "As a visitor" do
    describe "when I visit '/venues/:id' " do
      it '19. I see a link to delete that specific venue' do
        visit "/venues/#{venue_1.id}"

        expect(page).to have_link 'Delete Venue'
      end

      it '19. When I click the link, that venue is deleted, and I am re routed to the venue index page where that record is no longer there' do
        visit "/venues/#{venue_1.id}"
        
        click_link 'Delete Venue'

        expect(current_path).to eq('/venues')
        expect(page).to_not have_content(venue_1.name)
        expect(page).to have_content(venue_2.name)
        expect(page).to have_content(venue_3.name)
      end
    end
  end
end