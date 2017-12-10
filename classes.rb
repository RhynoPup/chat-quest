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

  def move(direction, player)
    if (player.position.directions.key?(direction))
      req = player.position.directions[direction].requirements
      if (req == (req & player.inventory) || req == (player.inventory & req))
        player.position = player.position.directions[direction]
        puts puts player.position.description
      else
        puts puts "Your path is blocked"
      end
    else
      puts puts "You cannot move that way"
    end
  end
end

class Player
  attr :position, true
  attr :inventory, true

  def initialize(room)
    self.position = room
    self.inventory = Array.new
  end

  def addItem(item)
    self.inventory.push(item)
  end

  def removeItem(item)
    self.inventory.delete(item)
  end

end

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