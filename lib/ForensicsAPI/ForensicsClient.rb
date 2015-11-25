module ForensicsAPI
    class ForensicsClient

	  # Directions while turning
	  FACING_NORTH = {:left => "west", :right => "east"}
	  FACING_SOUTH = {:left => "east", :right => "west"}
	  FACING_EAST  = {:left => "north", :right => "south"}
	  FACING_WEST  = {:left => "south", :right => "north"}


	  attr_accessor :x, :y, :facing

	  def initialize
		@x, @y = 0, 0
		@facing = :north
	  end

	  def locate_with_directions(directions)
        directions.each { |d| (d =~ /forward/) ? move : turn(d) }
      end



	  private

	  def turn(side)
		case @facing
		   when :north
		     @facing = FACING_NORTH[side.to_sym].to_sym
		   when :south
		     @facing = FACING_SOUTH[side.to_sym].to_sym 
		   when :east
		     @facing = FACING_EAST[side.to_sym].to_sym
		   when :west
		     @facing = FACING_WEST[side.to_sym].to_sym 
		end       	
	  end	


	  def move
		case @facing
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
end    