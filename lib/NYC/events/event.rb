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

  def self.dates
    counter = 1
    dates = self.all.collect {|event| event.date}
  end

  def self.delete_all
    @@all = []
  end
end
