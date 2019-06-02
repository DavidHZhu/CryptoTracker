class HomeController < ApplicationController
  # List of controllers and methods -> controlled by routes
  def index
    require 'net/http'
    require 'json'
    
    # Fetches CoinMarketCap prices from link
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)
    @my_coins = ["BTC", "STEEM", "ETH", "LTC",]
    
  end
  
  def about
  end
  
  def lookup
    @symbol = params[:sym]
    if @symbol
      @symbol = @symbol.upcase
    end 
    
    if @symbol == ""
      @symbol = "Please enter a valid currency."
    end 
    
    # Fetches CoinMarketCap prices from link
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @lookup = JSON.parse(@response)
    
  end
  
end
