class List
  attr_accessor :name
  @@lists = []

  def initialize(name)
    @name = name
    @@lists << self
  end

end 
