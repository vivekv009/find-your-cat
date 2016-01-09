require 'rubygems'
require 'bundler'


Bundler.setup


$:.push File.dirname(__FILE__)

require_relative 'ForensicsClient'
require 'sinatra/base'
require 'json'
require 'open-uri'



module ForensicsAPI
  class Server < Sinatra::Base

    configure do
      enable :sessions
    end    	

    get '/' do
      File.read(File.join('app', 'index.html'))
    end  

    get '/find_directions' do
    	session[:email] = params[:email]
    	dircetions_url = "http://which-technical-exercise.herokuapp.com/api/#{params[:email]}/directions"
    	session[:directions] = JSON.parse(open(dircetions_url).read)["directions"]
   	
    	content_type :json
    	session[:directions].to_json   	
    end	

    get '/search' do
    	locator = ForensicsAPI::CatLocator.new
    	locator.get_location(session[:directions])

    	location_url = "http://which-technical-exercise.herokuapp.com/api/#{session[:email]}/location/#{locator.x}/#{locator.y}" if locator

    	content_type :json
      open(location_url).read  
    end	



      run! if __FILE__ == $0
  end     
end