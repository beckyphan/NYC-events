class Scraper
  attr_accessor :url
  @@page = 1

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
      event.description = item.css("p[itemprop='description']").text.gsub("read more", '').strip
      event.venue = item.css("span[itemprop='name']").text
      event.link = "https://www.nyc.com" + item.css("a.venuelink").attr("href").text
    end
  end

  def self.page
    @@page
  end

  def self.more
    @@page += 1
    Scraper.new("https://www.nyc.com/events/?int4=5&p=" + "#{self.page}").make_events
    Event.more_names
  end

end
