require 'rails_helper'

RSpec.describe "Venue Artists Index Page", type: :feature do
  
  let!(:venue_1) { Venue.create!(decible_limit: true, rank:1, name: "Red Rocks") }

  describe "As a visitor" do
    describe "when I visit '/venues/:venue_id/artists' " do
      it '12. I see a link to add a new adoptable child for that parent "Create Child"' do
        visit "/venues/#{venue_1.id}/artists"

        expect(page).to have_link('Create Artist')
        click_link 'Create Artist'
        
        expect(current_path).to eq("/venues/#{venue_1.id}/artists/new")
      end

      it '12. after submitting I am taken back to the parent index, where the new record is shown amongst the old ones' do
        visit "/venues/#{venue_1.id}/artists/new"

        fill_in('Artist Name:', with: 'Lotus')
        fill_in('Full Band:', with: 'true')
        fill_in('Cost:', with: 52)
        click_button('Create New Artist')

        expect(current_path).to eq("/venues/#{venue_1.id}/artists")
        expect(page).to have_content('Lotus')
        expect(page).to have_content('true')
        expect(page).to have_content(52)
      end
    end
  end
end