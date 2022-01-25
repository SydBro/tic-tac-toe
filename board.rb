class Board
    attr_accessor :board, :win_state

    def initialize
        @board = Array.new(3) {Array.new(3)}
        @win_state = false
    end

    def board_state
        puts "____________"
        @board.each do |row|
            puts row.each {|p| p }.join("   ")
        end
        puts "____________"
    end

    def add_mark(mark, num1, num2)
        @board[num1][num2] = mark
    end

    def check_full
        full_board = false
        counter = 0
        @board.each do |row|
            if row.none?(nil) == true #if there are no empty spots on the row, add 1 to counter
                counter += 1
            end
        end
        if counter == 3
            full_board = true
        end
        return full_board
    end

    def win_conditions(player_name, player_mark)
        column_1 = []
        column_2 = []
        column_3 = []
        @board.each_with_index do |row, row_index|
            if row.all?(player_mark)
                p "#{player_name} has won! Row #{row_index + 1} has been filled with #{player_mark}s!"
                @win_state = true
            end
            column_1.push(row[0])
            column_2.push(row[1])
            column_3.push(row[2])
        end
        columns = [column_1, column_2, column_3]
        columns.each_with_index do |col, col_index|
            if col.all?(player_mark)
                p "#{player_name} has won! Column #{col_index + 1} has been filled with #{player_mark}s!"
                @win_state = true
            end
        end
        return @win_state
    end
end