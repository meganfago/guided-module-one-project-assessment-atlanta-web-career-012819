class CreateOutfits < ActiveRecord::Migration[5.2]
  def change
    create_table :outfits do |t|
      t.string :name
      t.string :top
      t.string :bottom
      t.string :shoes
      t.string :collection
      t.string :designer
      t.boolean :in_season
      t.integer :fanciness_level
    end
  end
end
