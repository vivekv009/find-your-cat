require 'minitest/autorun'
require 'minitest/spec'


require_relative "../lib/ForensicsAPI/ForensicsClient"

module ForensicsAPI
	class ForensicsClientSpec < Minitest::Spec


        let(:directions)  {["forward","right","forward","forward","forward","left","forward","forward","left","right","forward","right","forward","forward","right","forward","forward","left"]}
		
        it 'returns 5 and 2 as x and y co-ordinates' do 
            locator = CatLocator.new
            locator.get_location(directions)

            assert_equal(5, locator.x)
            assert_equal(2, locator.y)
        end




        let(:new_directions) {["forward","right","forward"]}

        it 'returns 1 and 1 as x and y co-ordinates' do 
           locator = CatLocator.new
           locator.get_location(new_directions)

           assert_equal(1, locator.x)
           assert_equal(1, locator.y)
           assert_equal(:east, locator.facing)
        end



        let(:dont_move) {[]}

        it 'returns 0 and 0 as x and y co-ordinates' do
           locator = CatLocator.new
           locator.get_location(dont_move)
    
           assert_equal(0, locator.x)
           assert_equal(0, locator.y)
           assert_equal(:north, locator.facing)
        end
	end	
end	