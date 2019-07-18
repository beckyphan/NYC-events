class NYC_Events::CLI

  def self.user_prompt
    if NYC_Events::List.lists.count > 0
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
      NYC_Events::Scraper.more
      NYC_Events::CLI.user_prompt
    elsif input == 'make_list'
      print "Type in a list name:"
      listname = gets.strip
      NYC_Events::List.new(listname)
      puts "\n----------"
      puts "Your list: #{listname} has been created!\nType 'list_options' at any time to add or view your lists."
      puts "----------"
      NYC_Events::CLI.user_prompt
    elsif input.to_i > 0
      if input.to_i <= NYC_Events::Event.all.count
        index = input.to_i - 1
        NYC_Events::Event.details(index)
      else
        puts "Did you want to see more events? If so, type 'more'"
      end
    elsif input == 'list_options'
      NYC_Events::List.options
    elsif input == "exit"
      return input = "exit"
    else
      puts "Your input was not recognized. Please try again."
    end
  end

  puts "Welcome to NYC.\nIt's been waiting for you."
  puts "\nThese are the events happening today:"

  today = NYC_Events::Scraper.new()
  today.make_events
  NYC_Events::Event.names

  puts "\nType 'exit' at anytime to quit program."
  NYC_Events::CLI.user_prompt
  input = gets.strip

  while input != 'exit'
    NYC_Events::CLI.action(input)
    input = gets.strip
  end

end
