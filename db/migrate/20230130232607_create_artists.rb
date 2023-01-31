class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.boolean :full_band
      t.integer :cost
      t.string :name
      t.references :venue, foreign_key: true
      t.timestamps
    end
  end
end
