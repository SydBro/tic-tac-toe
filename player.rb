class Player
    attr_reader :name, :mark
    @@instances = 0

    def initialize
        if @@instances >= 2
            raise "Only two players per game."
        elsif @@instances == 1
            @name = "Player 2"
            @mark = "O"
            @@instances += 1
        else
            @name = "Player 1"
            @mark = "X"
            @@instances += 1
        end
    end
end