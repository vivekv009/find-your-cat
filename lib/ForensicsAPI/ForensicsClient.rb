module ForensicsAPI

    class CoOrdinates
      	attr_accessor :x, :y, :facing

	def initialize
	    @x, @y = 0, 0
	    @facing = :north
	end
    end


    class PositioningClient
      	
	  # Directions while turning
	  FACING_NORTH = {:left => :west, :right => :east}
	  FACING_SOUTH = {:left => :east, :right => :west}
	  FACING_EAST  = {:left => :north, :right => :south}
	  FACING_WEST  = {:left => :south, :right => :north}

	  class << self

	     def follow_directions(directions, grid)
	  	 directions.each {|d| (d =~ /forward/) ? move(grid) : turn(grid, d)} if directions
	     end	
    


	     private

	     def turn(grid, side)
	     	 side = side.to_sym

		     case grid.facing
		       when :north
		         grid.facing = FACING_NORTH[side]
		       when :south
		         grid.facing = FACING_SOUTH[side]
		       when :east
		         grid.facing = FACING_EAST[side]
		       when :west
		         grid.facing = FACING_WEST[side]
		     end       	
	     end	


	     def move(grid)
		     case grid.facing
		       when :north
		         grid.y += 1
		       when :south
		         grid.y -= 1 
		       when :east
		         grid.x += 1
		       when :west
		         grid.x -= 1 
		    end
	    end	
	    
         end
      end   
end    
