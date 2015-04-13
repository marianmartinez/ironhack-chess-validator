require "pry"

module ChessHelper

	def rook_movement
		origin_x, origin_y = get_origin
		 destination_x, destination_y = get_destination
		 if  origin_x == destination_x || origin_y == destination_y
		  "Legal"
		 else
		 	"Illegal"
		 end
	end

	def bishop_movement
		 origin_x, origin_y = get_origin
		 destination_x, destination_y = get_destination
		 if (destination_x - origin_x).abs == (destination_y - origin_y).abs
		 	"Legal"
		 else
		 	"Illegal"
		 end
	end

end

class Piece

	include ChessHelper

	CHAR_TO_INT_HASH = {
      "A" => 1,
      "B" => 2,
      "C" => 3,
      "D" => 4,
      "E" => 5,
      "F" => 6,
      "G" => 7,
      "H" => 8
    }

	def initialize(initial_position, final_position, color)
		@initial_position = initial_position
		@final_position = final_position
		@color = color
	end

	def get_origin
		@origin_x = CHAR_TO_INT_HASH[@initial_position[0]]
		@origin_y = @initial_position[1].to_i
		return @origin_x, @origin_y	
	end

	def get_destination
		@destination_x = CHAR_TO_INT_HASH[@final_position[0]]
		@destination_y = @final_position[1].to_i
		return @destination_x, @destination_y
	end

end

class Rook < Piece
	def legal?
		rook_movement
	end
end

class Bishop < Piece
	def legal?
		bishop_movement
	end
end

class Queen < Piece
	def legal?
		if rook_movement == "Legal" || bishop_movement == "Legal"	
		 "Legal"
		else
		 	"Illegal"
		end
	end
end

class King < Piece
	def legal?
		origin_x, origin_y = get_origin
		destination_x, destination_y = get_destination
		if (destination_x - origin_x).abs <= 1 && (destination_y - origin_y).abs <= 1
		 	"Legal"
		 else
		 	"Illegal"
		 end
	end
end

class Knight < Piece
	def legal?
		origin_x, origin_y = get_origin
		destination_x, destination_y = get_destination
		#binding.pry
		if (destination_x - origin_x).abs == 1 && (destination_y - origin_y).abs == 2 ||
		  (destination_x - origin_x).abs == 2 && (destination_y - origin_y).abs == 1
		 	"Legal"
		 else
		 	"Illegal"
		 end
	end
end

class Pawn < Piece
	def legal?
		origin_x, origin_y = get_origin
		destination_x, destination_y = get_destination
		if @color == "Black"
			## --------- ##
		end
	end
end

puts rook_movement = Rook.new("H1","H3", "Black").legal?
puts bishop_movement = Bishop.new("C8","F5", "Black").legal?
puts queen_movement = Queen.new("C1","E3", "Black").legal?
puts king_movement = King.new("C3","A5", "Black").legal?
puts knight_movement = Knight.new("C3","H6", "Black").legal?
puts pawn_movement = Pawn.new("C3","H6", "Black").legal?