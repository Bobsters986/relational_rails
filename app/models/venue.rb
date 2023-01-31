class Venue < ApplicationRecord
  has_many :artists, dependent: :destroy
end
