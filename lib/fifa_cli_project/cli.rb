class Fifa::CLI

  def call
      puts "Welcome to the Fifa 2018 CLI app!"

      Fifa::Team.all << Fifa::Team.new("Greece", "www.greece.com")
      Fifa::Team.all << Fifa::Team.new("Canada", "www.canada.com")

      loop do
        teams_exist = Fifa::Team.list_teams #list the teams, return 1 if there is at least 1 team
        if teams_exist > 0 #if there are teams to list, ask which one to look up
          team = ask_team
          if team #if a team was selected, show its players
            puts "Ok, here are the players..."
            puts "Type 'y' to see the list of teams. Any other entry will quit"
            list_again_input = gets.strip
            if list_again_input != "y"
              puts "Ok, bye"
              break
            end
          else
            #Fifa app ending, country chosen was "Exit"
            break
          end
        else #if no teams - quit
            puts "Hopefully there will be participation next year. Goodbye"
            break
        end

      end #do loop
  end #call

  def ask_team
    loop do
      puts "Enter the country name to list the players (or 'Exit' to quit):"
      team_input = gets.strip
      #format input a little so it's all lowercase except the first letter
      #this means user input of e.g Greece and greece are both ok
      team_input.downcase!
      team_input.capitalize!
      team = nil
      if team_input == "Exit"
        puts "Bye for now"
        return team
      elsif team_input == "Greece"
        puts "#{team_input} selected"
        team = team_input
        return team
      else
        puts "#{team_input} not found"
      end
    end
  end #ask_team

end
