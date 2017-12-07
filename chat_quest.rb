require_relative 'classes'

game = App.new

room1 = Room.new
room2 = Room.new
room3 = Room.new

room1.update("This is room1. Welcome!",[],{"nw" => room3, "w" => room2},[])
room2.update("This is room2.",["spoon"],{"e" => room1},["fork"])
room3.update("This is room3.",["fork"],{"se" => room1},[])

player1 = Player.new(room1)

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
        puts puts "This room has a " + player1.position.inventory[0] + " in it."
      end

    when 'inventory', 'items'
      puts player1.inventory

    when 'take', 'grab'
      if(!txt.empty? && player1.position.inventory.include?(txt.downcase))
        player1.addItem(txt.downcase)
        player1.position.inventory.delete(txt.downcase)
      else
        puts puts "I do not understand"
      end
    
    else
      puts App.invalidCommand
  end 
end
