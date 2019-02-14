class CreateWardrobes < ActiveRecord::Migration[5.2]
  def change
    create_table :wardrobes do |t|
      t.integer :stylist_id
      t.integer :outfit_id
    end
  end
end
