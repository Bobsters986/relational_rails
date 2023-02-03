require 'rails_helper'

RSpec.describe Venue, type: :model do
  it {should have_many :artists}

  describe 'class methods' do
    let!(:venue_1) { Venue.create!(decible_limit: true, rank:1, name: "Red Rocks", created_at: Time.now - 1.hour) }
    let!(:venue_2) { Venue.create!(decible_limit: false, rank:2, name: "Mission Ballroom", created_at: Time.now - 2.hour) }
    let!(:venue_3) { Venue.create!(decible_limit: false, rank:5, name: "Ball Arena") }
    
    describe '#sort' do
      it 'sorts venues based on most recently created at' do
        expect(Venue.sort).to eq([venue_2, venue_1, venue_3])
      end
    end
  end
end
