class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.boolean :decible_limit
      t.integer :rank
      t.string :name
      t.timestamps
    end
  end
end
