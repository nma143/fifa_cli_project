class Fifa::CLI

def call
    puts "Welcome to the Fifa 2018 CLI app!"

    Fifa::Team.all << Fifa::Team.new("Greece", "www.greece.com")
    Fifa::Team.all << Fifa::Team.new("Canada", "www.canada.com")
    Fifa::Team.list_teams
end



end
