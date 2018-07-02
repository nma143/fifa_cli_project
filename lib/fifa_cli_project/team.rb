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

      self.all.each.with_index(1) do |team, index|
        puts "#{index}. #{team.name}"
      end
      return 1
    end
  end

end
