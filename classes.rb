class Player
  attr :position, true

  def initialize(room)
    self.position = room
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