require 'nokogiri'
require 'restclient'

class LiquidBread

  def initialize
    @url = 'http://www.liquidbread.cz/dennimenu/'
    @css_selector = '#content'
  end

  def load
    {
      id: self.class.to_s,
      name: 'Liquid Bread',
      url: @url,
      content: parse(scrape)
    }
  end

  def scrape
    page = Nokogiri::HTML.parse(RestClient.get(@url))

    page.css(@css_selector).text
  end

  def parse(text)
    text
  end
end
