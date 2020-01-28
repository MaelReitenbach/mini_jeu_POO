require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("Jose")

while player1.life_points > 0 && player2.life_points > 0
puts "Voici l'etat de chaque joueur :"
player1.show_state
player2.show_state

sleep(1)

puts "Passons a la phase d'attaque"
player1.attacks(player2)
if player2.life_points <= 0
	break
end	
player2.attacks(player1)

puts ""
sleep(1)
end

binding.pry