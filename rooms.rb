class Room
	attr :description, true
	attr :inventory, true

	def initialize( des, inv )
		self.description = des
		self.inventory = inv
	end
end

room1 = Room.new("This is room1. Welcome!","")
room2 = Room.new("This is room2.", "")