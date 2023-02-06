class Artist < ApplicationRecord
  belongs_to :venue

  def self.only_true
    where ("full_band")
  end
end
