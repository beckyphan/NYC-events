class CLI
  def self.user_prompt
    puts "\nTo view details of the event, select event number."
    puts "To view more events, type 'more'"
    puts "To create a list, type 'create list'"
  end

  puts "Welcome to NYC.\nIt's been waiting for you."
  puts "\nThese are the events happening today:"

  today = Scraper.new()

  today.make_events

  Event.names
  CLI.user_prompt
  input = gets.strip

  if input == 'more'
    Scraper.more
  elsif input > 0
    index = input.to_i - 1
  elsif input == 'create list'
    print "Type in a list name:"
    listname = gets.strip
    List.new(listname)
    puts "Your list has been created! To add an event to your list, type 'your_listname.add(event_number)'"
  else
    puts "Your input was not recognized. Please try again."
    input = gets.strip
  end

end
