module ForensicsAPI


    # A model of Cartesian Co-Ordinate System which can tell 2D position
    # with the assumption of every movement leading to unit displacement
    class GridSystem
      	attr_accessor :x, :y

      	def initialize
      		@x, @y = 0, 0
      	end	
        
        # Based on facing direction, new movement along X or Y axis will be tracked
	    def move(facing)
	    	case facing
		       when :north
		         @y += 1
		       when :south
		         @y -= 1 
		       when :east
		         @x += 1
		       when :west
		         @x -= 1 
		    end
	    end	
    end

    # A simplistic compass which can point to N - North, E - East, W - West and S - South directions
    class Compass

    	# Assuming if you were to face one of the above directions, turning L - Left or R - Right will give new direction
    	FACING_NORTH = {:left => :west, :right => :east}
	    FACING_SOUTH = {:left => :east, :right => :west}
	    FACING_EAST  = {:left => :north, :right => :south}
	    FACING_WEST  = {:left => :south, :right => :north}

    	attr_accessor :facing

    	def initialize
    		@facing = :north
    	end	


        # Based on facing direction, turning will lead to new direction 
    	def turn(turn)
	     	 side = turn.to_sym

		     case @facing
		       when :north
		         @facing = FACING_NORTH[side]
		       when :south
		         @facing = FACING_SOUTH[side]
		       when :east
		         @facing = FACING_EAST[side]
		       when :west
		         @facing = FACING_WEST[side]
		     end       	
	    end	
    end		


    class CatLocator

    	 attr_accessor :grid, :compass

    	 def initialize
    	 	 @grid = GridSystem.new
	     	 @compass = Compass.new
	     end 	 
  
         # Passing a set of movements and directions will update the Grid and Compass classes  
	     def move_with_directions(directions)
	     	 directions.each {|d| (d =~ /forward/) ? move : turn(d) } if directions
	     end	

         # Method to retrieve latest position along X axis
	     def x
	     	grid.x
	     end


	     # Method to retrieve latest position along Y axis
	     def y
	        grid.y
	     end
	     
	     # Method to retrieve latest direction from the compass
	     def facing
	        compass.facing
	     end   

	     private 

	     def move
	     	grid.move(facing)
	     end
	     
	     def turn(side)
	       compass.turn(side)
	     end  	

    end  
end    
