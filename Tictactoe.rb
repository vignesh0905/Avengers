class Board

  WIN_COMBINATION = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze
  attr_accessor :game_board

  def initialize

    @game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  end



  def display_board

    system('clear')

    display_first_line(game_board)

    display_line_break

    display_second_line(game_board)

    display_line_break

    display_third_line(game_board)

  end



  def win_board(player)

    WIN_COMBINATION.any? do |win|

      win.all? { |position| @game_board[position] == player.symbol }

    end

  end



  def draw

    @game_board.all? { |position| position.is_a? String }

  end



  protected



  def display_first_line(game_board)

    puts "#{game_board[0]} | #{game_board[1]} | #{game_board[2]} "

  end



  def display_second_line(game_board)

    puts "#{game_board[3]} | #{game_board[4]} | #{game_board[5]} "

  end



  def display_third_line(game_board)

    puts "#{game_board[6]} | #{game_board[7]} | #{game_board[8]} "

  end



  def display_line_break

    puts '---------'

  end

end


#game


class Game

  protected



  attr_accessor :player_x, :player_o, :board, :turncount, :player1, :player2



  def initialize(player1, player2)
    @player1 = player1
    
    @player2 = player2

    @board = Board.new

    @player_x = Player.new(player1, 'X', board, self)

    @player_o = Player.new(player2, 'O', board, self)

    @turncount = 1

  end



  public



  def play

    until @turncount > 9

      if @turncount.odd?

        board.display_board

        turn(player_x)

      elsif @turncount.even?

        board.display_board

        turn(player_o)

      end

    end

  end



  protected



  def turn(player)

    player.recieve_input

    if board.win_board(player) == true

      @turncount += 10

      board.display_board

      puts "#{player.name} wins the game!"

    elsif board.draw == true

      board.display_board

      puts "It's a tie!"

    end

    @turncount += 1

  end

end

#player
class Player

  attr_accessor :name, :symbol, :board, :game



  protected



  def initialize(name, symbol, board, game)

    @name = name

    @symbol = symbol

    @board = board

    @game = game

  end



  public



  def recieve_input

    puts "#{name}, where do you want to place your mark: "

    begin

      choice = gets.chomp

      choice = Integer(choice)

    rescue ArgumentError

      puts 'Please enter a number what do you see in the board'

      retry

    end

    check_choice_not_taken(choice)

  end



  protected



  def check_choice_not_taken(choice)

    case board.game_board[choice - 1]

    when Integer

      board.game_board[choice - 1] = symbol.to_s

    when String

      puts 'That position is already taken'

      puts 'Try another spot'

      recieve_input

    end

  end

end

# Ready to play

puts "Please enter First player name >"

player1 = gets.chomp

puts "#{player1} you got X, Use X to play\n"


puts "Please enter Second player name >"
player2 = gets.chomp
puts "#{player2} you got O, Use O to play\n"


z = Game.new(player1, player2)
z.play
