require 'require_all'

require_rel 'restaurants'

class MenuController < ApplicationController

  def initialize
    super

    @restaurants = [
      LiquidBread.new,
      NaPoliBistro.new,
      NaPurkynce.new,
      RestauraceAPizzerieNaPlace.new,
      RestauraceRubin.new,
      UDvouKosu.new
    ]
  end

  def index
    @menus = @restaurants.map{ |r| r.load }
  end
end
