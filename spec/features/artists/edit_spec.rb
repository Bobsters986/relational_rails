require 'rails_helper'

RSpec.describe 'Editing an existing artist' do

  let!(:venue_1) { Venue.create!(decible_limit: true, rank:1, name: "Red Rocks") }
  let!(:artist_1) { Artist.create!(full_band: true, cost: 60, name: "STS9", venue: venue_1) }

  describe "As a visitor" do
    describe "when I visit '/artists/:id' " do
      # Then I see a link to update that Child "Update Child"
      # When I click the link
      # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
      # When I click the button to submit the form "Update Child"
      # Then a `PATCH` request is sent to '/child_table_name/:id',
      # the child's data is updated,
      # and I am redirected to the Child Show page where I see the Child's updated information

      it '14. links to the artist edit page, from the specific artists show page' do
        visit "/artists/#{artist_1.id}"

        expect(page).to have_button("Update #{artist_1.name}")

        click_button "Update #{artist_1.name}"
        
        expect(current_path).to eq("/artists/#{artist_1.id}/edit")
      end

      it '14. can update the venue, then return to the venue show page with its updated info' do
        visit "/artists/#{artist_1.id}"

        expect(page).to have_content('STS9')

        click_button 'Update STS9'

        fill_in('Artist Name:', with: 'Sound Tribe Sector 9')
        fill_in('Full Band:', with: 'false')
        fill_in('Cost:', with: 99 )
        click_button 'Update Artist'

        expect(current_path).to eq("/artists/#{artist_1.id}")
        expect(page).to have_content('Sound Tribe Sector 9')
        expect(page).to have_content('false')
        expect(page).to have_content(99)
      end
    end
  end
end