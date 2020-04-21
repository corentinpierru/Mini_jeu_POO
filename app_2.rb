require 'bundler'
Bundler.require

require_relative 'lib/player'

#Fonction contenant le deuxième jeu, appelles les classes Player et HumanPlayer
  def orchestre2
    puts "--------------------------------------------------------------"#présentation
    puts "|Welcome sur le nouveau fortnite !                            |"
    puts "|Sauves ta POO et sois le dernier en vie pour gagner la partie|"
    puts "--------------------------------------------------------------"
    puts "Quel est ton pseudo valeureux guerrier ?" 
    user = HumanPlayer.new(gets.chomp) #définition du pseudo
    player1 = Player.new("Josiane")
    player2 = Player.new("José")
    enemies = [player1, player2]
    while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
      puts "Quelle action veux-tu effectuer ?" #Presentation menu
      puts ""
      puts "a - chercher une meilleure arme"
      puts "s - chercher à se soigner"
      puts ""
      puts "Attaquer un joueur en vue"
      print "0 - " 
      puts player1.show_state
      print "1 - " 
      puts player2.show_state
      strategic_choice = gets.chomp #choix strategique fait en fonction de la fonction
      if strategic_choice == "a"
        user.search_weapon
      elsif strategic_choice == "s"
        user.search_health_pack
      elsif strategic_choice == "0"
        user.attacks(player1)
      elsif strategic_choice == "1"
        user.attacks(player2)
      else
        puts "tu t'es trompé de choix, tu perds un tour !"
      end #fin du if choix stratégique
      enemies.each do |player| #player contient Josiane et José
        if player.life_points > 0
        player.attacks(user)
        end #fin du if PV ennemies
      end #fin de la boucle each contenant les ennemies 
    end #fin de la boucle while du combat
    if user.life_points > 0
      puts "BRAVO, t'as gagné t'es le meilleur"
    else
      puts "Merdouillasse, t'as perdu"
    end #fin du if affichage "victoire ou défaite"
  end #fin de orchestre2
  orchestre2