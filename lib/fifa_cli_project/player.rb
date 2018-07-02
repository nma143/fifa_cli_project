class Fifa::Player

  attr_reader :name, :age, :jersey_number, :position, :team

  def initialize(name, age, jersey_number, position, team)
    @name = name
    @age = age
    @jersey_number = jersey_number
    @position = position
    @team = team
  end

end
