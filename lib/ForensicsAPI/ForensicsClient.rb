module ForensicsAPI

    class GridSystem
      	attr_accessor :x, :y

      	def initialize
      		@x, @y = 0, 0
      	end	

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

    class Compass
    	# Directions while turning
	FACING_NORTH = {:left => :west, :right => :east}
	FACING_SOUTH = {:left => :east, :right => :west}
	FACING_EAST  = {:left => :north, :right => :south}
	FACING_WEST  = {:left => :south, :right => :north}

    	attr_accessor :facing

    	def initialize
    		@facing = :north
    	end	

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
  
	def get_location(directions)
	   directions.each {|d| (d =~ /forward/) ? grid.move(facing) : compass.turn(d)} if directions
	end	

	def x
	   grid.x
	end
	     
	def y
	   grid.y
	end
	     
	def facing
	   compass.facing
	end       	
    end  
end    
