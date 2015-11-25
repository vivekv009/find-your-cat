require 'minitest/autorun'
require 'minitest/spec'


require_relative "../lib/ForensicsAPI/ForensicsClient"

module ForensicsAPI
	class ForensicsClientSpec < Minitest::Spec
		let(:directions) {["forward","right","forward","forward","forward","left","forward","forward","left","right","forward","right","forward","forward","right","forward","forward","left"]}

        it 'returns 5 and 2 as x and y co-ordinates' do 
           client = ForensicsAPI::ForensicsClient.new
           client.locate_with_directions(directions)
    
           assert_equal(5, client.x)
           assert_equal(2, client.y)
        end




        let(:new_directions) {["forward","right","forward"]}

        it 'returns 1 and 1 as x and y co-ordinates' do 
           client = ForensicsAPI::ForensicsClient.new
           client.locate_with_directions(new_directions)
    
           assert_equal(1, client.x)
           assert_equal(1, client.y)
        end



        let(:dont_move) {[]}

        it 'returns 0 and 0 as x and y co-ordinates' do 
           client = ForensicsAPI::ForensicsClient.new
           client.locate_with_directions(dont_move)
    
           assert_equal(0, client.x)
           assert_equal(0, client.y)
        end
        

	end	
end	