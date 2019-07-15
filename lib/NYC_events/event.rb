class Event
  attr_accessor :name, :date, :day, :time, :venue, :description, :link
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
    #scraper pulls in 20 items per page
    starter = Scraper.page * 20 - 19 # formula to continue numbering
    more_events = starter

    puts "\n"
    self.all.each do |event|
      event = "#{counter}. #{event.name}"
      puts event if counter == more_events
      counter += 1
      more_events += 1 if counter > starter
    end
  end

  def self.details(index)
    event = @@all[index]
    puts "\n----------"
    puts "#{event.name}\n\t#{event.date} || #{event.time}\n\t@#{event.venue}"
    puts "#{event.description}"
    puts "----------"
  end

  def self.dates
    counter = 1
    dates = self.all.collect {|event| event.date}
  end

end
