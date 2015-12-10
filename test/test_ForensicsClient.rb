require 'minitest/autorun'
require 'minitest/spec'


require_relative "../lib/ForensicsAPI/ForensicsClient"

module ForensicsAPI
	class ForensicsClientSpec < Minitest::Spec


        let(:directions)  {["forward","right","forward","forward","forward","left","forward","forward","left","right","forward","right","forward","forward","right","forward","forward","left"]}
		
        it 'returns 5 and 2 as x and y co-ordinates' do 
           grid = CoOrdinates.new
           PositioningClient.follow_directions(directions, grid)

           assert_equal(5, grid.x)
           assert_equal(2, grid.y)
        end




        let(:new_directions) {["forward","right","forward"]}

        it 'returns 1 and 1 as x and y co-ordinates' do 
           grid = CoOrdinates.new
           PositioningClient.follow_directions(new_directions, grid)

           assert_equal(1, grid.x)
           assert_equal(1, grid.y)
           assert_equal(:east, grid.facing)
        end



        let(:dont_move) {[]}

        it 'returns 0 and 0 as x and y co-ordinates' do 
           grid = CoOrdinates.new
           PositioningClient.follow_directions(dont_move, grid)
    
           assert_equal(0, grid.x)
           assert_equal(0, grid.y)
           assert_equal(:north, grid.facing)
        end
	end	
end	