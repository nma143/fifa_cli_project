class Fifa::Team

  @@all = []

  attr_accessor :name, :url, :players

  def initialize(name, url)
    @name = name
    @url = url
    @players = []
  end

end
