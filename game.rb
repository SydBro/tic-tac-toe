class Game
    require_relative 'player.rb'
    require_relative 'board.rb'
    attr_reader :player1, :player2, :board

    def initialize
        @player1 = Player.new
        @player2 = Player.new
        @board = Board.new
        @end_game = false
    end

    def play
        players = [@player1, @player2]
        until (@board.check_full == true || @end_game == true)
            players.each do |player|
                player_win = @board.win_conditions(player.name, player.mark)
                if (player_win == true)
                    @board.board_state
                    @end_game = true
                    break
                elsif (@board.check_full == true && @end_game == false)
                    @board.board_state
                    puts "Game over; no more space on the board."
                    break
                else
                    @board.board_state #displays the board state at the beginning of each player's turn
                    p "#{player.name}, your move. Which row do you want to put your #{player.mark}?"
                    player_row = gets.chomp.to_i
                    p "Which column do you want to put your #{player.mark}?"
                    player_column = gets.chomp.to_i
                    until (player_row.to_s.match(/[0-2]/) && player_column.to_s.match(/[0-2]/) && @board.board[player_row][player_column] == nil)
                        p "Invalid placement. Enter a number 0 through 2 on an unoccupied space."
                        p "#{player.name}, which row do you want to put your #{player.mark}?"
                        player_row = gets.chomp.to_i
                        p "Which column do you want to put your #{player.mark}?"
                        player_column = gets.chomp.to_i
                    end
                    @board.add_mark(player.mark, player_row, player_column)
                    @board.win_conditions(player.name, player.mark)
                end
            end
        end
        #new_game()
    end

=begin
    def new_game
        puts "Thank you for playing! Do you want to play again?"
        puts "Enter y or n"
        play_again = gets.chomp
        until (play_again == "y" || "n")
            if play_again == "n"
                puts "Thanks for playing!"
            elsif play_again == "y"
                @board = Board.new
                play()
            else
                "Invlaid response. Do you want to play again?"
                puts "Enter y or n"
                play_again = gets.chomp
            end
        end
    end
=end
end

new_game = Game.new
new_game.play