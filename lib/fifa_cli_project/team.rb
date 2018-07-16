class Fifa::Team

  @@all = []

  attr_accessor :name, :url, :players

  def initialize(name, url)
    @name = name
    @url = url
    @players = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find{|team| team.name==name}
  end

  def self.create_from_scraper
    puts "I'm scraping the list of teams"
    array_of_team_hashes = Fifa::Scraper.new.get_teams_info
    array_of_team_hashes.each do |team|
      Fifa::Team.new(team[:name], team[:url])
    end
  end

  def self.list_teams
    if self.all.length == 0 #only need to scrape for teams if I haven't already
      self.create_from_scraper
    end

    if self.all.length == 0
      puts "There are no teams"
      return 0
    else
      puts "Here are the teams in the 2018 tournament:"

      self.all.each.with_index(1) do |team, index|
        puts "#{index}. #{team.name}"
      end
      return 1
    end
  end

  def print_players

    if @players.length == 0 #only need to scrape for the players if I haven't already
      create_roster_from_scraper
    end

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

  def create_roster_from_scraper
    puts "I'm scraping all the player profiles from team #{@name}"
    array_of_player_hashes = Fifa::Scraper.new.get_players_info(@url)
    array_of_player_hashes.each do |player|
      @players << Fifa::Player.new(player[:name], player[:age], player[:jersey_number], player[:position], self)
    end
  end

end
