
require './lib/chess'

valid_input = false
load_game = false

if File.exist?("chess.yml")
    until valid_input
        puts "--Instruction--"
        puts  "<<--WHITE COIN-->>"
        puts  "Rook - (R)"
        puts  "Knight - (H)"
        puts  "Bishop - (B)"
        puts  "King - (K)"
        puts  "Queen - (Q)"
        puts  "Pawn - (P)"
        puts  "<<--BLACK COIN-->>"
        puts  "Rook - (#)"
        puts  "Knight - (&)"
        puts  "Bishop - (?)"
        puts  "King - ($)"
        puts  "Queen - (@)"
        puts  "Pawn - (*)"
        puts "Press - (S) Start a new game or Press - (L) Load a saved game?"
        choice = gets.chomp
        next if choice.empty?
        next unless "sSlL".include?(choice)
        valid_input = true
        load_game = true if "lL".include?(choice)
        puts
    end
end

name_entered_1 = false
name_entered_2 = false

unless load_game
    until name_entered_1
        puts "Player 1, Please Enter your name?"
        player1 = gets.chomp
        next if player1.empty?
        name_entered_1 = true
        puts
    end
    until name_entered_2
        puts "Player 2, Please Enter your name?"
        player2 = gets.chomp
        next if player2.empty?
        name_entered_2 = true
    end
end

game = Chess.new(player1, player2) unless load_game
game = Chess.new("player1", "player2", true) if load_game
game.play
