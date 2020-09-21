require 'nokogiri'
require 'restclient'

class RestauraceAPizzerieNaPlace

  def initialize
    @url = 'https://www.pizzerienaplace.cz/denni-menu/'
    @css_selector = '.widget-body'
  end

  def load
    {
      id: self.class.to_s,
      name: 'Restaurace a Pizzerie Na Place',
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
