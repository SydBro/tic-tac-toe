class Game
    require_relative 'player.rb'
    require_relative 'board.rb'
    attr_reader :player1, :player2, :board_state

    def initialize
        @player1 = Player.new
        @player2 = Player.new
        @board_state = Board.new
        @end_game = false
    end

    def play
        players = [@player1, @player2]
        until (@board_state.check_full == true)
            players.each do |player|
                p @board_state.board #displays the board state at the beginning of each player's turn
                p "#{player.name}, your move. Which row do you want to put your #{player.mark}?"
                player_row = gets.chomp.to_i
                p "Which column do you want to put your #{player.mark}?"
                player_column = gets.chomp.to_i
                until (player_row.to_s.match(/[0-2]/) && player_column.to_s.match(/[0-2]/) && @board_state.board[player_row][player_column] == nil)
                    p "Invalid placement. Enter a number 0 through 2 on an unoccupied space."
                    p "#{player.name}, which row do you want to put your #{player.mark}?"
                    player_row = gets.chomp.to_i
                    p "Which column do you want to put your #{player.mark}?"
                    player_column = gets.chomp.to_i
                end
                @board_state.add_mark(player.mark, player_row, player_column)
                @board_state.check_full
            end
        end
    end

=begin - methods to -be implemented
    def win_conditions()
        
    end

    def end_game
        
    end
=end

end

new_game = Game.new
new_game.play


