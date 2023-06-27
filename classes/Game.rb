class Game

  def initialize
    @currently_playing = nil
    @players = []
  end


  def run_game

    # greeting and instructions
    puts "-------------- Welcome to the Ruby_cli math game!-------------- "
    puts "These are the instructions: \n"
    puts "  You and your opponent will each have three lives. You will take turns answering the math questions."
    puts "  You will loose a life for each question you get worong. First person to loose all their lives looses.  "

    # register players 
    print "\n Player 1 resgiter! "
    player1 = Player.new(gets.chomp)
    @players.push(player1)

    print "\n Player 2 resgister! "
    player2 = Player.new(gets.chomp)
    @players.push(player2)


    # player 1 goes first 
    @currently_playing = @players[1]
    puts "\n First to register, first to play. #{@players[0].name} begin! \n\n"

    while (@currently_playing.num_of_lives > 0)
        run_round
    end

    end_game

  end


  def switch_player!
    if (@currently_playing == @players[0])
      @currently_playing = @players[1]
    else
      @currently_playing = @players[0]
    end

  end

  
  # called when one player has lost all lives. 
  def end_game
    puts "\n\n-------------- GAME OVER --------------"
    switch_player!
    puts "#{@currently_playing.name} YOU WIN!\n\n\n"
  end

  # Ask question. Checks players anwer. Reduces life if answer is wrong. Switches player 
  def run_round
      switch_player!
      question = Question.new()
      puts "-------------- NEW TURN --------------\n"
      puts "#{@currently_playing.name}, you have  #{@currently_playing.num_of_lives} out of 3 lives. Do youre best.\n"
      print "#{@currently_playing.name}, #{question.ask_question} "
      player_answer = gets.chomp.to_i

      if question.correct?(player_answer)
        puts "Yes, #{@currently_playing.name}! That is the correct answer.\n\n"
      else
        puts ".......really....... the right answer is #{question.correct_answer}.  You just lost a life! \n\n"
        @currently_playing.lose_a_life
      end
  end
end