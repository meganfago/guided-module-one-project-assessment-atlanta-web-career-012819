class Stylist < ActiveRecord::Base
  has_many :wardrobes
  has_many :outfits, through: :wardrobes

end
