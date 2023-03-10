require 'rails_helper'

RSpec.describe "Venues Index Page", type: :feature do
  
  let!(:venue_1) { Venue.create!(decible_limit: true, rank:1, name: "Red Rocks", created_at: Time.now - 1.hour) }
  let!(:venue_2) { Venue.create!(decible_limit: false, rank:2, name: "Mission Ballroom", created_at: Time.now - 2.hour) }
  let!(:venue_3) { Venue.create!(decible_limit: false, rank:5, name: "Ball Arena") }

  describe "As a visitor" do
    describe "when I visit '/venues' " do
      it "1. I see the name of each parent record in the system" do
        visit '/venues'
        
        expect(page).to have_content(venue_1.name)
        expect(page).to have_content(venue_2.name)
        expect(page).to have_content(venue_3.name)
      end

      it "6. I see that records are ordered by most recently created first" do
        visit '/venues'
        
        expect(page).to have_content(venue_1.created_at)
        expect(page).to have_content(venue_2.created_at)
        expect(page).to have_content(venue_3.created_at)
        expect(venue_1.name).to appear_before(venue_2.name)
        expect(venue_3.name).to appear_before(venue_1.name)
      end

      it '17. I see a link to edit that parents info, next to every parent' do
        visit '/venues'

        expect(page).to have_link("Update #{venue_1.name}")
        expect(page).to have_link("Update #{venue_2.name}")
        expect(page).to have_link("Update #{venue_3.name}")
      end

      it '17. When I click the link, I should be taken to that parents edit page where I can update its information' do
        visit '/venues'

        click_link "Update #{venue_3.name}"

        expect(current_path).to eq("/venues/#{venue_3.id}/edit")
      end

      it '22. Next to each venue, I see a link to delete that venue' do
        visit '/venues'

        expect(page).to have_link "Delete #{venue_1.name}"
        expect(page).to have_link "Delete #{venue_2.name}"
        expect(page).to have_link "Delete #{venue_3.name}"
      end

      it '22. When I click the link, that venue is deleted, and I am re routed to the venue index page where that record is no longer there' do
        visit '/venues'

        click_link "Delete #{venue_2.name}"
        click_link "Delete #{venue_3.name}"
        
        expect(current_path).to eq('/venues')
        expect(page).to have_content(venue_1.name)
        expect(page).to_not have_content(venue_2.name)
        expect(page).to_not have_content(venue_3.name)
      end
    end
  end
end