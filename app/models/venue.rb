class Venue < ApplicationRecord
  has_many :artists, dependent: :destroy

  def self.sort
    order(:created_at)
  end
end