class HomeController < ApplicationController
 require 'kitco'

  #rescue SocketError#, with: :getaddrinfo_tmp

   def index
    @gold = Kitco.gold
    @silver = Kitco.silver
    @platinum = Kitco.platinum
    @palladium = Kitco.palladium
    @rhodium = Kitco.rhodium
   end

   def about
   end

   private

    def getaddrinfo_tmp
     logger.error "Failed to open TCP connection to charts.kitco.com:80"
     #notice: 'Failed to connect to charts.kitco.com'
    end
end
