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