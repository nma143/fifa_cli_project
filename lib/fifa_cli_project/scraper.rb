class Fifa::Scraper

  def get_teams_info
    doc = Nokogiri::HTML(open ("https://www.fifa.com/worldcup/teams/"))
    array_of_team_hashes = []

    doc.css(".fi-team-card__team").each do |team|
      team_hash = Hash.new
      team_hash[:name] = team.css(".fi-team-card__info").text.strip
      team_hash[:url] = "https://www.fifa.com/worldcup/teams/team/" + team.attribute("data-team")
      array_of_team_hashes << team_hash
    end
    array_of_team_hashes
  end

  def get_players_info(team_url)
    doc = Nokogiri::HTML(open ("#{team_url}"))
    array_of_player_hashes = []

    doc.css(".fi-p").css(".fi-p__info").each do |player|
      player_hash = Hash.new
      player_hash[:name] = player.css(".fi-p__n").css("a").attribute("title").value
      player_hash[:age] = player.css(".fi-p__info--ageNum").text
      player_hash[:jersey_number] = player.css(".fi-p__num").text
      player_hash[:position] = player.css(".fi-p__info--role").text.gsub(/\s+/, "")
      puts "#{player_hash}"
      array_of_player_hashes << player_hash
    end
    array_of_player_hashes
  end

end
