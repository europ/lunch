require 'open-uri'
require 'nokogiri'

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
    page = Nokogiri::HTML.parse(URI(@url).open)

    page.css(@css_selector).text
  end
end
