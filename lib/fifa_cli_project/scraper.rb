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

end
