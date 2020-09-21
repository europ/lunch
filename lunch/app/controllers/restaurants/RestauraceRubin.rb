require 'nokogiri'
require 'restclient'

class RestauraceRubin

  def initialize
    @url = 'http://restauracerubin.cz/'
    @css_selector = 'div.container:nth-child(3)'
  end

  def load
    {
      id: self.class.to_s,
      name: 'Restaurace Rubín',
      url: @url,
      content: parse(scrape)
    }
  end

  def scrape
    page = Nokogiri::HTML.parse(RestClient.get(@url))

    page.css(@css_selector).text
  end

  def parse(text)
    text.delete("\r").gsub(/[ ]+/, " ").gsub(/(\n )+/, "\n").gsub(/\n+/, "\n")
  end
end
