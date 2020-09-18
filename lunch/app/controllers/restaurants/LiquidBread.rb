require 'open-uri'
require 'nokogiri'

class LiquidBread

  def initialize
    @url = 'http://www.liquidbread.cz/dennimenu/'
    @css_selector = '#content'
  end

  def load
    {
      url: @url,
      content: scrape
    }
  end

  def scrape
    page = Nokogiri::HTML.parse(URI(@url).open)

    page.css(@css_selector).text
  end
end
