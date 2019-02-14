class Wardrobe < ActiveRecord::Base
  belongs_to :stylist
  belongs_to :outfit
end
