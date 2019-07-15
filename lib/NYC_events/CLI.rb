class NYCEvents::CLI
  def self.user_prompt
    if List.lists.count > 0
      puts "\nTo view details of the event, select event number."
      puts "To view more events, type 'more'"
      puts "To view your lists or add events to your list, type 'list_options'"
    else
      puts "\nTo view details of the event, select event number."
      puts "To view more events, type 'more'"
      puts "To create a new list, type 'make_list'"
    end
  end

  def self.action(input)
    if input == 'more'
      Scraper.more
      CLI.user_prompt
    elsif input == 'make_list'
      print "Type in a list name:"
      listname = gets.strip
      List.new(listname)
      puts "\n----------"
      puts "Your list: #{listname} has been created!\nType 'list_options' at any time to add or view your lists."
      puts "----------"
      CLI.user_prompt
    elsif input.to_i > 0
      index = input.to_i - 1
      Event.details(index)
    elsif input == 'list_options'
      List.options
    else
      "Your input was not recognized. Please try again."
    end
  end

  puts "Welcome to NYC.\nIt's been waiting for you."
  puts "\nThese are the events happening today:"

  today = Scraper.new()
  today.make_events
  Event.names

  puts "\nType 'exit' at anytime to quit program."
  CLI.user_prompt
  input = gets.strip
  while input != 'exit'
    CLI.action(input)
    input = gets.strip
  end
end
