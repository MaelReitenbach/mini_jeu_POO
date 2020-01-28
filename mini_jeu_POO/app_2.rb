require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "'----------------------------------------'"
puts "|               BIENVENUE                |"
puts "|     dans 'Ils veulent tous ma POO'     |"
puts "| Soyez le dernier survivant pour gagner |"
puts "'----------------------------------------'"
puts ""
puts "-- Veuillez saisir le nom de votre combattant --"
print ">> " 
pseudo = gets.chomp.to_s
print ""
user = HumanPlayer.new("#{pseudo}")
ennemies = []
player1 = Player.new("Josiane")
player2 = Player.new("Jose")
ennemies << player1
ennemies << player2

while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
	user.show_state
	puts ""
	puts "Quel action veux-tu effectuer ?"
	puts ""
	puts "a - chercher une meilleure arme"
	puts "s - chercher a se soigner"
	puts ""
	puts "attaquer un joueur en vue :"
	print "0 -"
	player1.show_state
	print "1 -"
	player2.show_state
	puts ""
	choix = gets.chomp.to_s
	puts ""
	if choix == "a"
		user.search_weapon
	elsif choix == "s"
		user.search_health_pack
	elsif choix == "0"
		user.attacks(player1)
	elsif choix == "1"
		user.attacks(player2)
	else
		puts "Tu a raté ton action, tant pis."	
	end
	puts "----------"
	puts ""
	sleep(2)
	puts "Les ennemis t'attaquent !"
	puts ""
	ennemies.each do |x|
		if x.life_points > 0
		x.attacks(user)
		end
		sleep (1)
	end
	puts ""
	puts"-- Fin du tour --"
	puts""
	sleep(2)
end	
if user.life_points > 0 
	puts "BRAVO ! Tu a gagné.e !"
else 	
	puts "T'a perdu, t'es nul vrere"
end	