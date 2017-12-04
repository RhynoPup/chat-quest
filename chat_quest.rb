#require_relative 'rooms'

class Room
  attr :description, true
  attr :inventory, true
  attr :directions, true
  attr :requirements, true

  def update(des,inv,dir,req)
    self.description = des
    self.inventory = inv
    self.directions = dir
    self.requirements = req
  end
end

room1 = Room.new
room2 = Room.new
room3 = Room.new

room1.update("This is room1. Welcome!",[""],{"nw" => room3, "w" => room2},[""])
room2.update("This is room2.",["spoon"],{"e" => room1},[""])
room3.update("This is room3.",[""],{"se" => room1},[""])

class App 
  def self.hello
    puts "hello to you too"
  end
  def self.invalidCommand
    puts "Invalid command"
  end
  def self.moveCommand(direction)
    puts "You said go, " + direction
  end
end

class Player
  attr :position, true

  def initialize(room)
    self.position = room
  end
end

player1 = Player.new(room1)

loop do
  input = gets.chomp
  command, *params = input.split /\s/
  case command
    when 'hello'
      puts App.hello
      puts player1.position.description
    
    when 'quit'
      break;
    
    when 'go', 'move', 'walk'
      case params[0].downcase
        when 'north', 'n'
          if (player1.position.directions.key?("n"))
            player1.position = player1.position.directions["n"]
            puts player1.position.description
          else
            puts "You cannot move that way"
          end
          #puts App.moveCommand(params[0])
        when 'northwest', 'nw'
          if (player1.position.directions.key?("nw"))
            player1.position = player1.position.directions["nw"]
            puts player1.position.description
          else
            puts "You cannot move that way"
          end
          #puts App.moveCommand(params[0])
        when 'west', 'w'
          if (player1.position.directions.key?("w"))
            player1.position = player1.position.directions["w"]
            puts player1.position.description
          else
            puts "You cannot move that way"
          end
          #puts App.moveCommand(params[0])
        when 'southwest', 'sw'
          if (player1.position.directions.key?("sw"))
            player1.position = player1.position.directions["sw"]
            puts player1.position.description
          else
            puts "You cannot move that way"
          end
          #puts App.moveCommand(params[0])
        when 'south', 's'
          if (player1.position.directions.key?("s"))
            player1.position = player1.position.directions["s"]
            puts player1.position.description
          else
            puts "You cannot move that way"
          end
          #puts App.moveCommand(params[0])
        when 'southeast', 'se'
          if (player1.position.directions.key?("se"))
            player1.position = player1.position.directions["se"]
            puts player1.position.description
          else
            puts "You cannot move that way"
          end
          #puts App.moveCommand(params[0])
        when 'east', 'e'
          if (player1.position.directions.key?("e"))
            player1.position = player1.position.directions["e"]
            puts player1.position.description
          else
            puts "You cannot move that way"
          end
          #puts App.moveCommand(params[0])
        when 'northeast', 'ne'
          if (player1.position.directions.key?("ne"))
            player1.position = player1.position.directions["ne"]
            puts player1.position.description
          else
            puts "You cannot move that way"
          end
          #puts App.moveCommand(params[0])
        else
          puts App.invalidCommand
        end
    
    else
      puts App.invalidCommand
  end 
end
