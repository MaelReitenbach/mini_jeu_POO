class Player
	attr_accessor :name, :life_points
	
	def initialize(name)
		@life_points = 10
		@name = name
	end	

	def show_state
		if @life_points <= 0
			puts "#{@name} est mort.e"
		else	
		puts "#{@name} a #{@life_points} points de vie"
		end
	end

	def gets_damage(n)
		@life_points = @life_points - n
		if @life_points <= 0
			puts "#{@name} est mort.e"
		end	
	end	

	def attacks(joueur)
		puts "#{@name} attaque #{joueur.name}"
		degats = compute_damage
		puts "#{@name} inflige #{degats} points de degats a #{joueur.name}"
		joueur.gets_damage(degats)
	end	

	def compute_damage
    	return rand(1..6)
 	end

end	

class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize(name)
		@life_points = 100
		@name = name
		@weapon_level = 1
	end	

	def show_state
		if @life_points <= 0
			puts "#{@name} est mort.e avec une arme de niveau #{@weapon_level}"
		else	
		puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
		end
	end

	def compute_damage
    	return rand(1..6) * @weapon_level
 	end

 	def search_weapon
 		niveau = rand(1..6)
 		puts "Tu a trouvé une arme de niveau #{niveau}"
 		if niveau > @weapon_level
 			puts "Elle est meilleure que ton arme actuelle, tu la prend."
 			@weapon_level = niveau
 		else
 			puts "L'arme trouvée n'est pas meilleure que ton arme actuelle, zut."
 		end		
 	end	

 	def search_health_pack
 		rech = rand(1..6)

 		 if rech == 1
 		 	puts "Tu n'a rien trouvé"
 		 elsif rech < 6 && rech > 1
 		 	puts "Tu a trouvé un pack de 50 points de vie !"
 		 	@life_points = @life_points + 50
 		 	if @life_points > 100 
 		 		@life_points = 100
 		 	end
 		 	puts "Tu a maintenant #{@life_points} points de vie"
 		 elsif rech == 6
 		 	puts "Tu a trouvé un pack de 80 points de vie !!!"
 		 	@life_points = @life_points + 80
 		 	if @life_points > 100 
 		 		@life_points = 100
 		 	end
 		 end
 		 	

 	end	

end	