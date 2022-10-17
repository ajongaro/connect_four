how do we want to set up our elements, hash/array?
  -either nested array or hash
what classes do we need?
  -board, turns, game
  -victory?
    def initialize(X)
      @victory = false
      some iteration, starting from bottom
      if condition, @victory = true
how should our program flow?

draw condition: if hash.include?(".") == false then game = over, tie