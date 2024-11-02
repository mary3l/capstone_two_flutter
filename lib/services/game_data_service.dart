import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:audio_classification/models/basketball_model.dart';

class DataService {
  // Load all season data from the JSON file
  Future<List<Season>> loadSeasonData() async {
    try {
      // Load the JSON file
      final String response =
          await rootBundle.loadString('lib/data/allData.json');

      // Decode the JSON data into a map
      final Map<String, dynamic> jsonData = json.decode(response);

      // Access the 'season' key from the JSON
      final List<dynamic> seasonData = jsonData['season'];
      print(seasonData);

      // Map the season data to a list of season objects
      return seasonData.map((season) => Season.fromJson(season)).toList();
    } catch (e) {
      // Print the error message to the console for debugging
      print('Error loading season data: $e');

      // Return an empty list in case of an error
      return [];
    }
  }

  // Future<List<Game>> loadGameData() async {
  //   try {
  //     final String response =
  //         await rootBundle.loadString('lib/data/allData.json');
  //     final Map<String, dynamic> jsonData = json.decode(response);

  //     // Access the 'games' key from the JSON
  //     final List<dynamic> gameData = jsonData['games'] ?? [];
  //     print(gameData);

  //     return gameData.map((game) => Game.fromJson(game)).toList();
  //   } catch (e) {
  //     print('Error loading game data: $e');
  //     return [];
  //   }
  // }

  // Future<List<Game>> loadGameData() async {
  //   try {
  //     final String response =
  //         await rootBundle.loadString('lib/data/allData.json');
  //     final Map<String, dynamic> jsonData = json.decode(response);

  //     // Access the 'games' key from the JSON under 'seasons'
  //     final List<dynamic> gameData = jsonData['seasons']['games'] ?? [];
  //     print(gameData);

  //     return gameData.map((game) => Game.fromJson(game)).toList();
  //   } catch (e) {
  //     print('Error loading game data: $e');
  //     return [];
  //   }
  // }

  Future<List<Map<String, dynamic>>> loadGameData() async {
    try {
      final String response =
          await rootBundle.loadString('lib/data/allData.json');
      final Map<String, dynamic> jsonData = json.decode(response);

      // Access the 'games' key and map to a simplified structure
      final List<dynamic> gameData = jsonData['seasons']['games'] ?? [];
      print(gameData);

      return gameData.map((game) {
        return {
          'title': game['title'],
          'date': game['date'],
          'teams': (game['teams'] as List<dynamic>?)
                  ?.map((team) => team['name'] as String)
                  .toList() ??
              [], // Ensure it handles null
        };
      }).toList();
    } catch (e) {
      print('Error loading game data: $e');
      return [];
    }
  }

  Future<List<Team>> loadTeamData() async {
    try {
      final String response =
          await rootBundle.loadString('lib/data/allData.json');
      final Map<String, dynamic> jsonData = json.decode(response);

      // Access the 'teams' key from the JSON
      final List<dynamic> teamData = jsonData['teams'];

      return teamData.map((team) => Team.fromJson(team)).toList();
    } catch (e) {
      print('Error loading team data: $e');
      return [];
    }
  }

  Future<List<Player>> loadPlayerData() async {
    try {
      final String response =
          await rootBundle.loadString('lib/data/allData.json');
      final Map<String, dynamic> jsonData = json.decode(response);

      // Access the 'players' key from the JSON
      final List<dynamic> playerData = jsonData['players'];

      return playerData.map((player) => Player.fromJson(player)).toList();
    } catch (e) {
      print('Error loading player data: $e');
      return [];
    }
  }
}
