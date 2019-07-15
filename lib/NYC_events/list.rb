class NYCEvents::List
  attr_accessor :name, :events
  @@lists = []

  def initialize(name)
    @name = name
    @events = []
    @@lists << self
  end

  def self.options
    puts "\n\nTo view your lists, type 'see lists'"
    puts "To return to main menu, type 'menu'"

    input = gets.strip

    if input == "menu"
      CLI.user_prompt
    elsif input == "see lists"
      self.view
      puts "To add an event, type in list#, event#"
      puts "To see events in list, type in list#"
      puts "To return to main menu, type 'menu'"
      self.see_lists_action
    else
      puts "Unclear response. Returning to main menu"
      CLI.user_prompt
    end

  end

  def self.see_lists_action
    list_input = gets.strip
    if list_input == "menu"
      CLI.user_prompt
    elsif list_input.include?(",")
      values = list_input.split(",")
      list_index = values[0].to_i - 1
      event_index = values[1].to_i - 1
      self.lists[list_index].add(event_index)
      puts "#{Event.all[event_index].name} has been added to #{self.lists[list_index].name}!\n"
      CLI.user_prompt
    else
      list_index = list_input.to_i - 1
      puts "#{self.lists[list_index].name}:"
      events_list = self.lists[list_index].view
      CLI.user_prompt
    end
  end

  def self.view
    counter = 1
    self.lists.each do |list|
      puts "\t#{counter}. #{list.name}"
      counter += 1
    end
  end

  def view
    self.events.each do |event|
      puts "\t#{event.name}"
    end
  end

  def add(index)
    @events << Event.all[index]
  end

  def self.lists
    @@lists
  end

  def self.name_lists
    @@lists.each do |list|
      list.name
    end
  end

end
