class Venue < ApplicationRecord
  has_many :artists, dependent: :destroy

  def self.sort
    order(created_at: :desc)
  end

  def artist_count
    self.artists.count
  end
end