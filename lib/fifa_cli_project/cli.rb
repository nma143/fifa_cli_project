class Fifa::CLI

  def call
      puts "Welcome to the Fifa 2018 CLI app!"

      loop do
        teams_exist = Fifa::Team.list_teams #list the teams, return 1 if there is at least 1 team
        if teams_exist > 0 #if there are teams to list, ask which one to look up
          team = ask_team
          if team #if a team was selected, show its players
            team.print_players
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
      puts "Enter the country name or country number to list the players (or 'Exit' to quit):"
      team_input = gets.strip
      #format input a little so it's all lowercase except the first letter
      #this means user input of e.g Greece and greece are both ok
      if team_input.match(/\A[-+]?\d+\z/) #if this is true, it's an integer
        team_input = team_input.to_i - 1 #switch to index for an arrya by subtracting 1
        #make sure it's between lenght of team array
        team = nil
        team = Fifa::Team.find_by_index(team_input) if team_input.between?(0, Fifa::Team.all.length-1)
        if !team #ie team = nil
          team_input += 1 # Will display to user there selection was not found, so add the 1 back
        end
      else #false or nil - then it's a string or not an integer ex 1.3
        team_input.downcase!
        team_input.capitalize!
        team = nil
        if team_input == "Exit"
          puts "Bye for now"
          return team
        else
          team = Fifa::Team.find_by_name(team_input)
        end
      end
      if team == nil #didn't find a match, tell user and ask again for country
        puts "#{team_input} not found"
      else #found a match to user's input country
        return team
      end
    end #do loop
  end #ask_team

end
