require 'pry'

#classe qui définit un joueur qui a deux valeurs en objet (son nom et ses PV)
class Player
  attr_accessor :name, :life_points

  #initialisation de ma classe qui doit prendre en entrer le paramètre "nom du joueur"
  def initialize(name_of_player)
    @name = name_of_player
    @life_points = 10
  end 

  #Permet de montrer les pts de vies ou d'afficher si la personne est dcd si c'est le cas
  def show_state
    if @life_points >0
      print "#{@name} a #{@life_points} points de vies"
    else 
      puts "#{@name} a été tué"
    end
  end

  #fonction qui réduit les pts de vies (à utiliser avec compute_damage)
  def gets_damage(damage)
    @life_points = @life_points - damage
  end

  #méthode attacks, elle permet d'afficher qui attaque qui et appelle les méthodes compute_damage et gets_damage pour le faire
  def attacks(player)
    puts "le joueur #{@name} attaque le joueur #{player.name}"
    damage_received = compute_damage
    player.gets_damage(damage_received)
    puts "le joueur #{@name} inflige #{damage_received} points de dégats à #{player.name}"
  end

  #fonction aléatoire qui renvoie un chiffre aléatoire entre 1 et 6 qui représente le nombre de dommage utilisé plus haut
  def compute_damage
    return rand(1..6)
  end
end

#création d'un nouvelle classe Player
class HumanPlayer < Player
  attr_accessor :weapon_level, :life_points

  #initialisation PV lvl arme et nom
  def initialize(name_of_player)
    @weapon_level = 1
    @name = name_of_player
    @life_points = 100
  end

  #montre nom et PV
  def show_state
    puts "#{@name} a #{@life_points} points de vies et une arme de niveau #{@weapon_level}"
  end

  #damage en fonction du niveau de l'arme 
  def compute_damage
    rand(1..6) * @weapon_level
  end

  #fonction qui fait que le HumanPlayer va chercher une meilleur arme, il la garde uniquement si elle est meilleure.
  def search_weapon
    find_weapon = rand(1..6)
    puts "tu as trouvé une arme de niveau #{find_weapon}"
    if find_weapon > @weapon_level
      @weapon_level = find_weapon
      puts "Trop cool, elle est meilleure que ton arme actuelle, tu la prends"
    else
      puts "Fais c****, elle n'est pas mieux que ton arme actuelle"
    end 
  end
  
  #fonction recherche de soin, résultat étant aléatoire entre 1 et 6, PV max = 100
  def search_health_pack
    dice_roll = rand(1..6)
    if dice_roll == 1
      puts "Tu n'as pas trouvé de quitte de soin..."
    elsif dice_roll == (2..5)
      @life_points = @life_points + 50
      puts "Sympa, un pack de 50 points de vies"
      if @life_points > 100
        @life_points = 100
      end
    else 
      @life_points = @life_points + 80
      puts "Amazing, un pack de 80 points de vies *_*"
      if @life_points > 100
        @life_points = 100
      end #fin du if des >100 points de vies
    end #fin du if qui if des chiffres du dice_roll
  end #fin de la méthode health_pack
end #fin de la classe HumanPlayer