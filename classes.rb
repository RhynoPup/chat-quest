class App 
  def self.hello
    puts "hello to you too"
  end
  def self.invalidCommand
    puts "I don't understand that"
  end
  def self.moveCommand(direction)
    puts "You said go, " + direction
  end

  def move(direction, player)
    if (player.position.directions.key?(direction))
      req = player.position.directions[direction].requirements
      if (req == (req & player.inventory) || req == (player.inventory & req))
        player.position = player.position.directions[direction]
        puts player.position.details
      else
        puts "Your path is blocked\n\n"
      end
    else
      puts "You cannot move that way\n\n"
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
  attr :name, true

  def update(name, des,inv,dir,req)
    self.name = name
    self.description = des
    self.inventory = inv
    self.directions = dir
    self.requirements = req
  end

  def details
    if (self.inventory.empty?)
        return self.description + "\n\n"
      else
        return self.description + "\nThis room has a " + self.inventory[0] + " in it.\n\n"
      end
  end
end