require 'rails_helper'

RSpec.describe Venue, type: :model do
  it {should have_many :artists}

    let!(:venue_1) { Venue.create!(decible_limit: true, rank:1, name: "Red Rocks", created_at: Time.now - 1.hour) }
    let!(:venue_2) { Venue.create!(decible_limit: false, rank:2, name: "Mission Ballroom", created_at: Time.now - 2.hour) }
    let!(:venue_3) { Venue.create!(decible_limit: false, rank:5, name: "Ball Arena") }

    let!(:artist_4) { Artist.create!(full_band: false, cost: 63, name: "Pretty Lights", venue: venue_1) }
    let!(:artist_5) { Artist.create!(full_band: true, cost: 70, name: "The String Cheese Incident", venue: venue_2) }
    let!(:artist_6) { Artist.create!(full_band: false, cost: 52, name: "Emancipator", venue: venue_2) }
    let!(:artist_7) { Artist.create!(full_band: true, cost: 75, name: "Billy Strings", venue: venue_2) }

  describe 'class methods' do
    describe '#sort' do
      it '6. sorts venues based on most recently created at' do
        expect(Venue.sort).to eq([venue_3, venue_1, venue_2])
      end
    end

    describe '#artist_count' do
      it '7. shows the number of the artists associated with the venue' do
        expect(venue_2.artist_count).to eq(3)
        expect(venue_1.artist_count).to eq(1)
      end
    end
  end
end
