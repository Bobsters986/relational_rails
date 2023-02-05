require 'rails_helper'

RSpec.describe 'Creating a new venue' do
  # Then I see a link to create a new Parent record, "New Parent"
  # When I click this link
  # Then I am taken to '/parents/new' where I  see a form for a new parent record
  # When I fill out the form with a new parent's attributes:
  # And I click the button "Create Parent" to submit the form
  # Then a `POST` request is sent to the '/parents' route,
  # a new parent record is created,
  # and I am redirected to the Parent Index page where I see the new Parent displayed.

  describe "As a visitor" do
    describe "when I visit '/venues' " do
      it '11. I can click a link to create a new parent, and I am taken to a page with a form to create that parent' do
        visit '/venues'

        expect(page).to have_link('Add New Venue')
        # save_and_open_page
        click_link('Add New Venue')

        expect(current_path).to eq('/venues/new')
        expect(page).to have_content("Add New Venue")
      end

      it '11. after submitting I am taken back to the parent index, where the new record is shown amongst the old ones' do
        visit '/venues/new'

        fill_in('Venue Name:', with: 'Cervantes Masterpiece Ballroom')
        fill_in('Decible Limit:', with: 'false')
        fill_in('Rank:', with: 6)
        click_button('Create New Venue')

        expect(current_path).to eq('/venues')
        expect(page).to have_content('Cervantes Masterpiece Ballroom')
      end
    end
  end
end