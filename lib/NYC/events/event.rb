class Event
  attr_accessor :name, :date, :day, :time, :venue, :description
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end
