require_relative 'classes'
require 'yaml'

game = App.new

deadEnd = Room.new
EWDirtRoad = Room.new
fork = Room.new
room4 = Room.new

deadEnd.update("Dead end", "You are at a dead end of a dirt road. The road goes to the east.\nIn the distance you can see that it will eventually fork off. The \ntrees here are very tall royal palms, and they are spaced equidistant \nfrom each other.",["shovel"],{"e" => EWDirtRoad},[])
EWDirtRoad.update("E/W Dirt road", "You are on the continuation of a dirt road. There are more trees on both sides of you. The road continues to the east and west.",["large boulder"],{"e" => fork, "w" => deadEnd},[])
fork.update("Fork", "You are at a fork of two passages, one to the northeast, and one to the southeast. The ground here seems very soft. You can also go back west.",[],{"se" => room4, "ne" => room4, "w" => EWDirtRoad},[])
#room4.update("This is room4.",[],{"s" => room4},[])

player1 = Player.new(deadEnd)
player1.addItem("A lamp")
puts player1.position.name
puts player1.position.details

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

    when 'inventory', 'items'
      puts player1.inventory

    when 'take', 'grab'
      if(!txt.empty? && player1.position.inventory.include?(txt.downcase))
        player1.addItem(txt.downcase)
        player1.position.inventory.delete(txt.downcase)
      else
        puts "I do not understand\n\n"
      end
    
    else
      puts App.invalidCommand
  end 
end
