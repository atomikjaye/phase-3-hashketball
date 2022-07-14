# Write your code below game_hash
require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# def get_players(field)
#   game_hash.each do |team, data| 
#     data
#     # binding.pry
#   end
# end

# methods with *** have to do with just players
def get_players
  game_hash[:home][:players] + game_hash[:away][:players]
end

def get_team(team_name)
  game_hash.find do |team_field, team_stats|
    team_stats[:team_name] == team_name
  end
end

#num_points_scored // takes player returns score
def num_points_scored(player_name)
  player_stats(player_name)[:points]
end
  
  # ***show_size // takes player returns shoe size
def shoe_size(player_name)
  player_stats(player_name)[:shoe]
end

  #team_colors // takes teamName returns color
def team_colors(team)
  get_team(team)[1][:colors]
end

  #team_names // returns Array of names
def team_names
  team_array = []
  game_hash.each do |team_field, team_stats|
    team_array << team_stats[:team_name]
  end
    team_array
end
  
# player_numbers of team
def player_numbers(team_name)
  player_num_array = []
  get_team(team_name)[1][:players].each do |player|
    player_num_array << player[:number]
  end
  player_num_array
end

  # *** player_stats // takes player name returns player stats
def player_stats(player_name)
  get_players.find do |player|
    player[:player_name] == player_name
  end
end
# *** big_shoe_rebounds // takes player with largest shoe returns rebound
def big_shoe_rebounds
  # sorted array makes biggest shoe last
  sorted_array =  get_players.sort_by{ |player| player[:shoe]}
  sorted_array.last[:rebounds]
end
## ADDITIONAL PRACTICE
# *** most_points_scored // which player has most points
def most_points_scored
  # sorted array makes biggest shoe last
  sorted_array =  get_players.sort_by{ |player| player[:points]}
  sorted_array.last[:player_name]
end

#winning_team // add all players points return team
def winning_team
  # on each team, add points, compare
  brooklyn_points = 0
  get_team("Brooklyn Nets")[1][:players].each do |player|
    brooklyn_points += player[:points]
  end
  charolette_points = 0
  get_team("Charlotte Hornets")[1][:players].each do |player|
    charolette_points += player[:points]
  end
  if brooklyn_points > charolette_points
    puts"Brooklyn Nets"
  else
    puts "Charlotte Hornets"
  end
end

# *** player_with_longest_name // returns player with ...
def player_with_longest_name
  get_players.sort_by{ |player| player[:player_name].length}.last[:player_name]
end

# *** long_name_steals_a_ton? // compare to all other players steals
def long_name_steals_a_ton?
  sorted_array = get_players.sort_by{ |player| player[:steals]}
  sorted_array.last[:player_name].include?(player_with_longest_name)

end

# get_players
# puts team_names
# num_points_scored("Jason Terry")
puts most_points_scored #Ben Gordon
winning_team # Brooklyn Nets 
player_with_longest_name # Bismack Biyombo
puts long_name_steals_a_ton? #true