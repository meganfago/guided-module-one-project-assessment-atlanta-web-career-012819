require 'pry'
class CommandLineInterface

 def run
    puts "Welcome to The Style Edit!"
    sleep (1)
    puts "Please choose a menu option"
    puts "1. Create User, 2. View Stylist Wardrobes,
3. Update Fanciness Level, 4. Add Outfit to Wardrobe, 5. Delete An Outfit in Wardrobe "
    answer = gets.chomp
      if answer == "1" || answer == "1."
         sleep(1)
         return create_a_stylist
      elsif answer == "2" || answer == "2."
         sleep(1)
         return list_of_outfits
      elsif answer == "3" || answer == "3."
         sleep(1)
        return update_outfit_fanciness_level
      elsif answer == "4" || answer == "4."
         sleep(1)
        return add_outift_to_wardrobe
      elsif answer == "5" || answer == "5."
        sleep(1)
        return delete_outfit_in_wardrobe
      else
        sleep(1)
        puts "Oh no! That isn't a valid menu option."
       end
    end
 end

### CREATE ###
  def create_a_stylist
    puts "Please create a username"
    user = gets.chomp
    if Stylist.find_by(name: user)
      puts "This name already exists!"
      create_a_stylist
    else stylist = Stylist.create(name: user)
      sleep(1)
      puts "Welcome to The Style Edit, #{stylist.name}!"
  end
end

### READ ###
  def list_of_outfits
    stylists = Stylist.all
    puts "Choose a stylist"
    puts "-------------------------------------"
    x = []
    stylists.each.with_index(1) do
      |s,i| puts "#{i}. #{s.name}"
      x << s
    end
    puts "-------------------------------------"
    puts "Please enter a current stylist id number
to see a list of outfits in their wardrobe:"
    answer = gets.chomp.to_i
    the_stylist = x[answer-1]
    if the_stylist
      the_stylist.outfits.each.with_index(1) do
        |outfit, i| puts "#{i}. #{outfit.name}"
      end
    else
      sleep(1)
      puts "Oh no! That isn't a valid stylist id."
    end
  end

### UPDATE ###
  def update_outfit_fanciness_level
    puts "Please select an outfit that you would like to update the fanciness level:"
    puts "-------------------------------------"
    puts  "1. Casual Day Outfit, 2. Date Outfit, 3. Office Outfit, 4. Gala Outfit"
    puts "-------------------------------------"
    sleep(1)
    answer = gets.chomp
    puts "Please type in a number 1-10 to update the fanciness level"
    level = gets.chomp
    outfits = [
      Outfit.find_by(name: "Casual Day Outfit"),
      Outfit.find_by(name: "Date Outfit"),
      Outfit.find_by(name: "Office Outfit"),
      Outfit.find_by(name: "Gala Outfit")
    ]
    if outfit = outfits[answer.to_i-1]
      outfit.update(fanciness_level: level.to_i)
      puts "Your #{outfit.name} has been updated with a new fanciness level of #{level}!"
    else
      puts "That doesn't seem right. Please try again."
    end
  end

### DELETE ###
  def delete_outfit_in_wardrobe
     outfits = list_of_outfits
     puts "Please enter the outfit id of the outfit you wish to delete"
     input = gets.chomp
     wardrobe = Wardrobe.find_by(outfit: outfits[input.to_i-1])
     wardrobe.destroy
     puts "The outfit has been deleted."
  end

###############################################################################
     ### CREATE 2 ###
     def add_outift_to_wardrobe
           #take a stylist and add an outfit to their wardrobe based on the list
           #of outfits they have to choose from
           puts "Please enter your username:"
           username = gets.chomp
           stylist = Stylist.find_by(name: username)
           puts "Please select an outfit that you would like to add to your wardrobe:"
           puts "-------------------------------------"
           puts  "1. Casual Day Outfit, 2. Date Outfit, 3. Office Outfit, 4. Gala Outfit"
           puts "-------------------------------------"
           sleep(1)
           answer = gets.chomp
             if answer.start_with?("1")
               outfit = Outfit.find_by(name: "Casual Day Outfit")
               Wardrobe.create(stylist_id: stylist.id , outfit_id: outfit.id)
             elsif answer.start_with?("2")
               outfit = Outfit.find_by(name: "Date Outfit")
               Wardrobe.create(stylist_id: stylist.id , outfit_id: outfit.id)
             elsif answer.start_with?("3")
               outfit = Outfit.find_by(name: "Office Outfit")
               Wardrobe.create(stylist_id: stylist.id , outfit_id: outfit.id)
             elsif answer.start_with?("4")
               outfit = Outfit.find_by(name: "Gala Outfit")
                 Wardrobe.create(stylist_id: stylist.id , outfit_id: outfit.id)
             else
               puts "That outfit id is invalid. Please try again."
             end
         end
