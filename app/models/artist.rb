class Artist < ApplicationRecord
  belongs_to :venue

  def self.only_true
    where(full_band: true)
  end

  def self.sort_alphabetically
    order(:name)
  end
end
