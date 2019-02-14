class Outfit < ActiveRecord::Base
  has_many :wardrobes
  has_many :stylists, through: :wardrobes  
end
