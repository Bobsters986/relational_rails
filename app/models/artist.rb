class Artist < ApplicationRecord
  belongs_to :venue

  def self.only_true
    where(full_band: true)
  end

  def self.sort_alphabetically
    order(:name)
  end

  def self.artist_cost_over(num)
    where("cost > #{num}")
    # where(:cost > num)
  end
end
