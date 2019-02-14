Stylist.destroy_all
Outfit.destroy_all
Wardrobe.destroy_all

#Stylists
allie = Stylist.create(name: "Allie")
katie = Stylist.create(name: "Katie")
rene = Stylist.create(name: "Rene")
tim = Stylist.create(name: "Tim")

#Outfits
casual_day_outfit = Outfit.create(name: "Casual Day Outfit",
  top: "Harley Davidson Crop Tee",
  bottom: "Destroyed Mom Jeans",shoes: "Gucci Mules",
  collection: "Spring 2019", designer: "Vintage",
  in_season: true, fanciness_level: 7)
date_outfit = Outfit.create(name: "Date Outfit",
  top: "Evan Oversized Roll Sleeve Tee",
  bottom: "Leather Mini Skirt", shoes: "Jeffrey Campbell Booties",
  collection: "Spring 2018", designer: "Alice and Olivia", in_season: true,
  fanciness_level: 8)
office_outfit = Outfit.create(name: "Office Outfit",
  top: "Cotton Shirt", bottom: "Floral fil coupe pant",
  shoes: "Sylvie leather pump", collection: "Fall 2018", designer: "Gucci",
  in_season: false, fanciness_level: 10)
gala_outfit = Outfit.create(name: "Gala Outfit",
  top: "Oversized Floral Coat", bottom: "Gold Silk Dress",
  shoes: "Gold Bow Pumps", collection: "Spring 1998", designer: "Christian Dior",
  in_season: true, fanciness_level: 10)

#Wardrobes
Wardrobe.create(stylist_id: allie.id, outfit_id: date_outfit.id)
Wardrobe.create(stylist_id: allie.id, outfit_id: gala_outfit.id)
Wardrobe.create(stylist_id: katie.id, outfit_id: gala_outfit.id)
Wardrobe.create(stylist_id: rene.id, outfit_id: office_outfit.id)
Wardrobe.create(stylist_id: tim.id, outfit_id: casual_day_outfit.id)
Wardrobe.create(stylist_id: tim.id, outfit_id: office_outfit.id)
