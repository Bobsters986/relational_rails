require 'rails_helper'

RSpec.describe 'Creating a new venue' do
  describe "As a visitor" do
    describe "when I visit '/venues' " do
      it '11. I can click a link to create a new parent, and I am taken to a page with a form to create that parent' do
        visit '/venues'

        expect(page).to have_link('Add New Venue')
        
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