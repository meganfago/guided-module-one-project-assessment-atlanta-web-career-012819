require 'pry'
class CommandLineInterface
  #FIXME: no duplicate Stylists, Outfits, Wardrobes
  #FIXME: show all Stylists
  #FIXME: show fanciness level on update
  #FIXME: make sure we don't delete something we don't have (*)
  #FIXME: make it so the program shows you everything you need to see. For example,
  #       anything you use rake console to see

  # def initialize
  #   @stylists = []
  # end

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
      stylist = Stylist.create(name: user)
      sleep(1)
      puts "Welcome to The Style Edit, #{stylist.name}!"
  end

### READ ###
  def list_of_outfits
      puts "Choose a stylist"
      puts "-------------------------------------"
      Stylist.all.each.with_index(1){ |s,i| puts "#{i}. #{s.name}" }
      puts "-------------------------------------"
      puts "Please enter a current stylist id number
to see a list of outfits in their wardrobe:"
    answer = gets.chomp
      if answer == "1" || answer == "1."
        allie = Stylist.find_by(name: "Allie")
        allie.outfits.each {|outfit| puts outfit.name}
      elsif answer == "2" || answer == "2."
        katie = Stylist.find_by(name: "Katie")
        katie.outfits.each {|outfit| puts outfit.name}
      elsif answer == "3" || answer == "3."
        rene = Stylist.find_by(name: "Rene")
        rene.outfits.each {|outfit| puts outfit.name}
      elsif answer == "4" || answer == "4."
        tim = Stylist.find_by(name: "Tim")
        tim.outfits.each {|outfit| puts outfit.name}
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
    if answer.start_with?("1")
      outfit = Outfit.find_by(name: "Casual Day Outfit")
      outfit.update(fanciness_level: level.to_i)
    elsif answer.start_with?("2")
      outfit = Outfit.find_by(name: "Date Outfit")
       outfit.update(fanciness_level: level.to_i)
    elsif answer.start_with?("3")
      outfit = Outfit.find_by(name: "Office Outfit")
      outfit.update(fanciness_level: level.to_i)
    elsif answer.start_with?("4")
      outfit = Outfit.find_by(name: "Gala Outfit")
        outfit.update(fanciness_level: level.to_i)
    else
      puts "That doesn't seem right. Please try again."
    end
  end

### DELETE ###
  def delete_outfit_in_wardrobe
    puts "Please enter your username:"
    username = gets.chomp
    stylist = Stylist.find_by(name: username)
    puts "Please select an outfit that you would like to delete from your wardrobe:"
    puts "-------------------------------------"
    puts  "1. Casual Day Outfit, 2. Date Outfit, 3. Office Outfit, 4. Gala Outfit"
    puts "-------------------------------------"
    sleep(1)
    answer = gets.chomp
      if answer.start_with?("1")
        outfit = Outfit.find_by(name: "Casual Day Outfit")
      wardrobe = Wardrobe.find_by(stylist_id: stylist.id , outfit_id: outfit.id)
      wardrobe.delete
      elsif answer.start_with?("2")
        outfit = Outfit.find_by(name: "Date Outfit")
        wardrobe = Wardrobe.find_by(stylist_id: stylist.id , outfit_id: outfit.id)
        wardrobe.delete
      elsif answer.start_with?("3")
        outfit = Outfit.find_by(name: "Office Outfit")
      wardrobe =  Wardrobe.find_by(stylist_id: stylist.id , outfit_id: outfit.id)
      wardrobe.delete
      elsif answer.start_with?("4")
        outfit = Outfit.find_by(name: "Gala Outfit")
          wardrobe = Wardrobe.find_by(stylist_id: stylist.id , outfit_id: outfit.id)
          wardrobe.delete
      else
        puts "That outfit id is invalid. Please try again."
      end
  end

  # def has_outfit(stylist_id, outfit_id)
  #   Wardrobe.find_by(stylist_id: stylist_id, outfit_id: outfit_id)
  #   if true
  #     Wardrobe.delete(stylist_id: stylist_id, outfit_id: outfit_id)
  #   end
  # end
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
