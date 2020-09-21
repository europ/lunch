require 'nokogiri'
require 'restclient'

class NaPoliBistro

  def initialize
    @url = 'https://bistronapoli.cz/denni-menu/'
    @css_selector = ['div.et_pb_section:nth-child(1)', '.et_animated > div:nth-child(1)']
  end

  def load
    {
      id: self.class.to_s,
      name: 'NAPOLI Bistro',
      url: @url,
      content: parse(scrape)
    }
  end

  def scrape
    page = Nokogiri::HTML.parse(RestClient.get(@url))

    text = ''
    @css_selector.each do |sel|
      text << page.css(sel).text
    end

    text
  end

  def parse(text)
    text.gsub(/[\r\t]/, '').gsub(/[ ]+/, " ").gsub(/(\n )+/, "\n").gsub(/\n+/, "\n")
  end
end
