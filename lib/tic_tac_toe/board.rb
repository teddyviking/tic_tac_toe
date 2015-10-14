module TicTacToe
  class Board
    attr_reader :grid

    def initialize(grid = default_grid)
      @grid = grid
    end

    def get_cell(x, y)
      grid[y][x]
    end

    def set_cell(x, y, value)
      get_cell(x, y).value = value
    end

    def game_over
      return :winner if winner?
      return :draw if draw?
      false
    end

    def formatted_grid
      grid.each do |row|
        puts row.map { |cell| cell.value.empty? ? "_" : cell.value }.join(" ")
      end
    end

    private
    
    def default_grid
      Array.new(3) { Array.new(3) { Cell.new } }
      #same as saying:
      #example_array = [
                    #   [Cell.new, Cell.new, Cell.new],
                    #   [Cell.new, Cell.new, Cell.new],
                    #   [Cell.new, Cell.new, Cell.new]
                    #  ]
    end

    def draw?
      grid_values = grid.flatten.map { |cell| cell.value }

      true unless grid_values.include("")
    end

    def winner?
      winning_positions.each do |winning_position|
        position_values = winning_position_values(winning_position)


        next if position_values.all? { |position| position.empty?}


        return true if position_values.all? { |position| position == self[0] }
      end
      false
    end

    def winning_positions
      grid + # rows
      grid.transpose + # columns
      diagonals # two diagonals
    end

    def diagonals
      [
        [get_cell(0, 0), get_cell(1, 1), get_cell(2, 2)],
        [get_cell(0, 2), get_cell(1, 1), get_cell(2, 0)]
      ]
    end

    def winning_position_values(winning_position)
      winning_position.map { |cell| cell.value }
    end


  end
end




#Board#default_grid is a private method as it is only meant to be called by instances 
#of the Board class. It is important to limit public interfaces early in a project, 
#especially for methods that are only intended to respond to messages from self.


# Since we defined grid to be an attr_reader, Ruby has automatically wrapped an instance 
# method around the @grid instance variable, so we don’t need to reference the @grid instance 
# variable directly. Whenever possible, it is preferable to reference instance methods over 
# instance variables as instance methods are less likely to be changes in arbitrary ways 
# that may be difficult to track.


#