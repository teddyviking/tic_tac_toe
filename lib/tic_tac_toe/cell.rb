module TicTacToe
 class Cell
    attr_reader :value

    def initialize(value="")
      @value = value
    end

  end
end 



#The Cell class is wrapped in a TicTacToe module to follow Ruby gem conventions and prevent class name collisions when gems are included in other projects. 

#If Cell is initialized without any arguments, the cell’s value will be the empty string, but Cell can also be initialized with an argument. 

#After a cell is instantiated, its value cannot be updated.