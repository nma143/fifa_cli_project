class Fifa::Team

  @@all = []

  attr_accessor :name, :url, :players

  def initialize(name, url)
    @name = name
    @url = url
    @players = []
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find{|team| team.name==name}
  end

  def self.list_teams
    if self.all.length == 0
      puts "There are no teams"
      return 0
    else
      puts "Here are the teams in the 2018 tournament:"
      Fifa::Scraper.new.get_teams_info
      self.all.each.with_index(1) do |team, index|
        puts "#{index}. #{team.name}"
      end
      return 1
    end
  end

  def print_players
    if @players.length == 0
      puts "There are no players on this team"
      return 0
    else
      puts "Here are the players on team #{@name}:"
      @players.each.with_index(1) do |player, index|
        puts "#{index}. Name: #{player.name}, Age: #{player.age}, Jersey: #{player.jersey_number}, Position: #{player.position}"
      end
    end

  end

end
