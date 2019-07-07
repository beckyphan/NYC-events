require 'nokogiri'
require 'open-uri'

# require_all './events/'

class Scraper
  attr_accessor :url

  def initialize(url = "https://www.nyc.com/events/?int4=5")
    @url = url
  end

  def get_page
    Nokogiri::HTML(open(self.url))
  end

  def get_events
    self.get_page.css(".eventrecords li[itemtype='http://schema.org/Event']")
  end

  def make_events
    self.get_events.each do |item|
      event = Event.new
      event.name = item.css("h3").text.strip
      event.date = item.css(".desktop-date").text.gsub("\n                    ", ' ').strip
      event.time = item.css(".datevenue strong.nyc-mobile-hidden").text
      event.description = item.css("p[itemprop='description']").text.strip
      event.venue = item.css(".venuelink").text.gsub("read more", '').strip
    end
  end

end
