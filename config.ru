require "bundler/setup"

require File.join(File.dirname(__FILE__), "lib/ForensicsAPI/server")

run ForensicsAPI::Server

use Rack::Static, 
:urls => ['/js', '/img', '/css', '/partials'],
:root => 'app'