require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def orchestre3
  puts "--------------------------------------------------------------"#présentation
    puts "|Welcome sur le nouveau fortnite !                            |"
    puts "|Sauves ta POO et sois le dernier en vie pour gagner la partie|"
    puts "--------------------------------------------------------------"
    puts "Quel est ton pseudo valeureux guerrier ?"
  user_name = gets.chomp
  my_game = Game.new(user_name)
  while my_game.is_still_ongoing?
    my_game.menu
    my_game.menu_choice
    my_game.show_players
    my_game.enemies_attack
  end #end of boucle while
 my_game.end 
end #end of orchestre3
orchestre3