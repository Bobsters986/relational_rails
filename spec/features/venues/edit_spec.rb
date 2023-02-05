require 'rails_helper'

RSpec.describe 'Editing an existing venue' do

  let!(:venue_1) { Venue.create!(decible_limit: true, rank:1, name: "Red Rocks") }

  describe "As a visitor" do
    describe "when I visit '/venues/:id' " do
      # Then I see a link to update the parent "Update Parent"
      # When I click the link "Update Parent"
      # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
      # When I fill out the form with updated information
      # And I click the button to submit the form
      # Then a `PATCH` request is sent to '/parents/:id',
      # the parent's info is updated,
      # and I am redirected to the Parent's Show page where I see the parent's updated info

      it '12. links to the edit page, from the specific venues show page' do
        visit "/venues/#{venue_1.id}"

        expect(page).to have_button("Update #{venue_1.name}")

        click_button "Update #{venue_1.name}"

        expect(current_path).to eq("/venues/#{venue_1.id}/edit")
      end

      it '12. can update the venue, then return to the venue show page with its updated info' do
        visit "/venues/#{venue_1.id}"

        expect(page).to have_content('Red Rocks')

        click_button 'Update Red Rocks'

        fill_in('Venue Name:', with: 'Rad Rks')
        fill_in('Decible Limit:', with: 'false')
        fill_in('Rank:', with: 3)
        click_button 'Update Venue'

        expect(current_path).to eq("/venues/#{venue_1.id}")
        expect(page).to have_content('Rad Rks')
        expect(page).to have_content('false')
        expect(page).to have_content(3)
      end
    end
  end
end