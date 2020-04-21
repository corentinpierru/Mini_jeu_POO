require 'bundler'
Bundler.require

#appelle les deux fichiers "game et player"
require_relative 'lib/game'
require_relative 'lib/player'

#fonction fight qui orchestre le combat
def orchestre1
  player1 = Player.new("Josiane")
  player2 = Player.new("José")
  while player1.life_points > 0 && player2.life_points > 0
    puts ""   
    puts "Voici l'état de chaque joueur :"
    puts "#{player1.show_state} #{player2.show_state}"
    puts ""
    puts "Fight ! Passons à la phase d'attaque"
    player1.attacks(player2)
    if player2.life_points <= 0
      break
    else
      player2.attacks(player1)
    end
  end
  if player2.life_points<= 0
    player2.show_state
  else 
    player1.show_state
  end
  puts "Fin du fight"
end
orchestre1
