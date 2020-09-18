require 'open-uri'
require 'nokogiri'

class NaPurkynce

  def initialize
    @url = 'http://www.napurkynce.cz/daily-menu/'
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
