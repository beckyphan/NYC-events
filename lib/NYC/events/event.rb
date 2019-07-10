class Event
  attr_accessor :name, :date, :day, :time, :venue, :description
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.names
    counter = 1
    self.all.each do |event|
      puts "#{counter}. #{event.name}"
      counter += 1
    end
  end

  def self.more_names
    counter = 1
    starter = Scraper.page * 10 + 1
    more_events = starter

    puts "\n"
    self.all.each do |event|
      event = "#{counter}. #{event.name}"
      puts event if counter == more_events
      counter += 1
      more_events += 1 if counter > starter
    end
  end

  def self.dates
    counter = 1
    dates = self.all.collect {|event| event.date}
  end

  def self.delete_all
    @@all = []
  end
end
