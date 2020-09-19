require 'nokogiri'
require 'restclient'

class UDvouKosu

  def initialize
    @url = 'https://udvoukosu.webs.com/j-deln-l-stek'
    @css_selector = '.webs-module-text'
  end

  def load
    {
      id: self.class.to_s,
      name: self.class.to_s.gsub(/([A-Z])/, ' \1').strip,
      url: @url,
      content: parse(scrape)
    }
  end

  def scrape
    page = Nokogiri::HTML.parse(RestClient.get(@url))

    page.css(@css_selector).text
  end

  def parse(text)
    keywords = ["Pondělí", "Úterý", "Středa", "Čtvrtek", "Pátek"]
    text.gsub(/(#{keywords.join("|")})/, "\n\n\\1")
  end
end
