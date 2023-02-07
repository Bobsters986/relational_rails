require 'rails_helper'

RSpec.describe Artist, type: :model do

  let!(:venue_2) { Venue.create!(decible_limit: false, rank:2, name: "Mission Ballroom", created_at: Time.now - 2.hour) }

  let!(:artist_5) { Artist.create!(full_band: true, cost: 70, name: "The String Cheese Incident", venue: venue_2) }
  let!(:artist_6) { Artist.create!(full_band: false, cost: 52, name: "Emancipator", venue: venue_2) }
  let!(:artist_7) { Artist.create!(full_band: true, cost: 75, name: "Billy Strings", venue: venue_2) }

  it {should belong_to :venue}

  describe 'class methods' do
    describe '#only_true' do
      it '15. will only show artist records if they are a full band/boolean true' do
        expect(Artist.only_true).to eq([artist_5, artist_7])
      end
    end

    describe '#sort_alphabetically' do
      it '16. will only show artist records if they are a full band/boolean true' do
        expect(Artist.sort_alphabetically).to eq([artist_7, artist_6, artist_5])
      end
    end
  end
end
