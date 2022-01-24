class Board
    attr_accessor :board

    def initialize
        @board = Array.new(3) {Array.new(3)}
    end

    def add_mark(mark, num1, num2)
        @board[num1][num2] = mark
    end

    def check_full
        full_board = false
        counter = 0
        @board.each_with_index do |row, row_index|
            if row.none?(nil) == true #if there are no empty spots on the row, add 1 to counter
                counter += 1
            end
        end
        if counter == 3
            full_board = true
            puts "Game over; no more space on the board."
        end
        return full_board
    end
end