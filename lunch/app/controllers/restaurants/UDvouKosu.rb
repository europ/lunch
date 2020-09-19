require 'nokogiri'
require 'restclient'

class UDvouKosu

  def initialize
    @url = 'https://udvoukosu.webs.com/j-deln-l-stek'
    @css_selector = '.webs-module-text'
  end

  def load
    {
      url: @url,
      content: scrape
    }
  end

  def scrape
    page = Nokogiri::HTML.parse(RestClient.get(@url))

    page.css(@css_selector).text
  end
end
