require_relative 'restaurants/UDvouKosu'
require_relative 'restaurants/LiquidBread'
require_relative 'restaurants/NaPurkynce'

class MenuController < ApplicationController

  def initialize
  	super
    @restaurants = [
      UDvouKosu.new,
      LiquidBread.new,
      NaPurkynce.new
    ]
  end

  def index
    @menus = @restaurants.map{ |r| r.load }
  end
end
