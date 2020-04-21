require 'pry'

class Game
  attr_accessor :human_player, :enemies

    def initialize(player)
      @human_player = HumanPlayer
      @enemies = []
      @human_player = HumanPlayer.new(player)
      @enemies = [Player.new("ennemie1"), Player.new("ennemie2"), Player.new("ennemie3"), Player.new("ennemie4")]
    end

    def kill_player(name_of_mechant)
      if name_of_mechant.life_points <= 0
          enemies.delete(name_of_mechant)
      end 
    end #end of kill_player method

    def is_still_ongoing?
    number_of_enemies_alive = 0
      if @human_player.life_points > 0
        if @enemies.each.life_points > 0
          number_of_enemies_alive += 1
        end
      end
      if number_of_enemies_alive > 0
        return true
      else
        return false
      end
    end #end of still ongoing method

    def show_players
      puts "#{@human_player.name} a #{@human_player.life_points} points de vies"
      @enemies.each do |mechant|
        puts "#{mechant.name} a #{mechant.life_points} points de vies"
      end #end of "".each do" that show mechant name and life points
    end #end of show_players method

    def menu
      puts "Quelle action veux-tu effectuer ?" #Presentation menu
      puts ""
      puts "a - chercher une meilleure arme"
      puts "s - chercher à se soigner"
      puts ""
      puts "Attaquer un joueur en vue"
      print "0 - "
      puts @human_player.show_state
      counter_of_ennemies = 0
      @enemies.each do |mechant|
        print "#{counter_of_ennemies} - " 
        puts mechant.show_state
        counter_of_ennemies += 1
      end
    end #end of menu method

    def menu_choice
      user_input = gets.chomp
      strategic_choice = gets.chomp #choix strategique fait en fonction de la fonction
      if strategic_choice == "a"
        @human_player.search_weapon
      elsif strategic_choice == "s"
        @human_player.search_health_pack
      elsif strategic_choice == (0..100)
        counter_of_mechant = 0
        @enemies.each do |mechant|
          if counter_of_mechant == strategic_choice
            @human_player.attacks(mechant)
          end#end of if
        end#end of do
      end#end of if
    end #end of menu_choice method

    def enemies_attack
      @enemies.each do |mechant| #player contient Josiane et José
        if mechant.life_points > 0
        mechant.attacks(@human_player)
        end #end of if 
      end #end of do
    end #fin de la methode enemies_attack

    def end
      if is_still_ongoing? == false
        if @human_player.life_points > 0
          puts "Bravo tu as gagné la game, t'es fooooort"
        else
          puts "t'es nul à chier frère"
        end #fin if pour Victoire ou défaite
      end #fin premier if
    end #fin de la méthode end 

end #end of Game class
