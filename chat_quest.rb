 require_relative 'classes'
require 'yaml'

game = App.new

data = YAML.load_file("dunnet.yml")

print data["test"]

#player1 = Player.new(town_square)

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
      puts player1.position.details
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
        puts "I do not understand\n\n"
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
