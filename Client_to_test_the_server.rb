#!/usr/bin/env ruby
require 'socket'      # Sockets are in standard library

hostname = 'http://107.170.218.128/criduino'
port = 5632           

TCPSocket.open(hostname, port) do |socket|
  socket.puts "26-2A-07-D8-4D-07"  # Send mac address to the server
  puts socket.gets     # Print lines from the socket
  socket.flush         # Reload the flux
  socket.close         # Close the socket
end
