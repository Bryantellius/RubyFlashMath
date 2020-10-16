# Randomization
puts "\nRandomization"
puts

# Random.rand(range args) allows you to generate random numbers
# Special note: (0..10) = 0-10, (0...10) = 0-9
rand_num = Random.rand(0..10)
puts rand_num

def start_game
    system "clear
    "
    puts "Welcome to Ruby Math!"
    puts "Which flashcards would you like to play?"
    puts "\nAddition, Subtraction, Multiplication, or Division..."

    game_choice = gets.chomp.downcase

    if game_choice == "addition"
        flashcards("+")
    elsif game_choice == "subtraction"
        flashcards("-")
    elsif game_choice == "multiplication"
        flashcards("*")
    elsif game_choice == "division"
        flashcards("/")
    else
        puts "Choice invalid. Please hit enter and try again."
        gets
        start_game
    end
end

def flashcards(op)
    system "clear"

    card_one = Random.rand(0..30)
    card_two = Random.rand(0..30)

    if op == "+"
        correct = card_one + card_two
    elsif op == "-"
        correct = card_one - card_two 
    elsif op == "*"
        correct = card_one * card_two
    else
        card_one = Random.rand(1..30)
        card_two = Random.rand(1..30)
        until card_one > card_two and card_one % card_two == 0 do
            card_one = Random.rand(1..30)
            card_two = Random.rand(1..30)
        end
        correct = card_one / card_two
    end

    puts "#{card_one} #{op} #{card_two}"
    answer = gets.chomp.to_i

    if answer == correct
        puts "Correct! #{card_one} #{op} #{card_two} = #{answer}"
    else
        puts "Incorrect.. #{card_one} #{op} #{card_two} = #{correct}"
    end

    puts "Would you like another card?"
    puts "\nYes, No, Restart..."

    continue = gets.chomp.downcase

    if continue == "yes"
        flashcards(op)
    elsif continue == "no"
        puts "Thanks for playing!"
        exit
    elsif continue == "restart"
        start_game
    else
        puts "Invalid input. Please hit enter and try again."
        gets

        flashcards(op)
    end
end

# Run/Call start_game method
start_game