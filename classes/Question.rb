class Question

  attr_reader :correct_answer

  def initialize()
    @number_left = rand(1..50)
    @number_right = rand(1..50)
    @correct_answer = @number_left + @number_right
  end

  def ask_question
    "What does #{@number_left} plus #{@number_right} equal"
  end

  def correct?(player_answer)
    return player_answer == @correct_answer
  end

end