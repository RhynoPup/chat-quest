require_relative 'classes'

game = App.new

town_square = Room.new
room2 = Room.new
room3 = Room.new
tavern = Room.new
bank = Room.new

town_square.update("You are standing in front of a tavern whose enterance is to the north.",[],{"n" => tavern, "e" => bank, "nw" => room3, "w" => room2},[])
room2.update("This is room2.",["spoon"],{"e" => town_square},["fork"])
room3.update("This is room3.",["fork"],{"se" => town_square},[])
tavern.update("You are inside a tavern.", [], {"s" => town_square}, [])
bank.update("You are inside the Autumnfall bank.", ["bag of gold coins"], {"w" => town_square}, [])

player1 = Player.new(town_square)

loop do
  print "> "
  input = gets.chomp
  command, *params = input.split /\s/
  txt = params.join(" ")
  case command.downcase
    when 'hello'
      puts App.hello
    
    when 'quit'
      break;
    
    when 'go', 'move', 'walk'
      case txt.downcase
        when 'north', 'n'
          game.move("n", player1)
        when 'northwest', 'nw'
          game.move("nw", player1)
        when 'west', 'w'
          game.move("w", player1)
        when 'southwest', 'sw'
          game.move("sw", player1)
        when 'south', 's'
          game.move("s", player1)
        when 'southeast', 'se'
          game.move("se", player1)
        when 'east', 'e'
          game.move("e", player1)
        when 'northeast', 'ne'
          game.move("ne", player1)
        else
          puts App.invalidCommand
      end

    when 'look'
      if (player1.position.inventory.empty?)
        puts puts player1.position.description
      else
        puts player1.position.description
        puts puts "There is a " + player1.position.inventory[0] + " here."
      end

    when 'inventory', 'items'
      if !player1.inventory.empty?
        puts player1.inventory
      else
        puts "There is nothing in your inventory."
      end

    when 'take', 'grab'
      if(!txt.empty? && player1.position.inventory.include?(txt.downcase))
        player1.addItem(txt.downcase)
        player1.position.inventory.delete(txt.downcase)
      else
        puts puts "I do not understand"
      end

    when 'drop'
      if (!txt.empty?)
        player1.removeItem(txt.downcase)
        player1.position.inventory.push(txt.downcase)
      end

    else
      puts App.invalidCommand
  end 
end
