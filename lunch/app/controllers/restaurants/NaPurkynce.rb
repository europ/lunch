require 'nokogiri'
require 'restclient'

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
    page = Nokogiri::HTML.parse(RestClient.get(@url))

    page.css(@css_selector).text
  end
end
