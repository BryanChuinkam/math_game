class Player

  attr_reader :name, :num_of_lives

  def initialize(name)
    @name = name
    @num_of_lives = 3
  end

  def lose_a_life
    @num_of_lives -= 1
  end

end