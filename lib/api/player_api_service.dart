import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:audio_classification/models/test_basketball_model.dart';
import 'api_constants.dart'; // Define your API base URL here.

class PlayerApiService {
  // Fetches a list of players
  Future<List<Player>> fetchPlayers() async {
    final response =
        await http.get(Uri.parse('${ApiConstants.baseUrl}/players'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((player) => Player.fromMap(player)).toList();
    } else {
      throw Exception('Failed to load players');
    }
  }

  // Fetch a single player by ID
  Future<Player> fetchPlayerById(int playerID) async {
    final response =
        await http.get(Uri.parse('${ApiConstants.baseUrl}/players/$playerID'));

    if (response.statusCode == 200) {
      return Player.fromMap(json.decode(response.body));
    } else {
      throw Exception('Failed to load player');
    }
  }

  // Add a new player
  Future<Player> addPlayer(Player player) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}/players'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(player.toMap()),
    );

    if (response.statusCode == 201) {
      return Player.fromMap(json.decode(response.body));
    } else {
      throw Exception('Failed to add player');
    }
  }

  // Update an existing player
  Future<Player> updatePlayer(Player player) async {
    final response = await http.put(
      Uri.parse('${ApiConstants.baseUrl}/players/${player.playerID}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(player.toMap()),
    );

    if (response.statusCode == 200) {
      return Player.fromMap(json.decode(response.body));
    } else {
      throw Exception('Failed to update player');
    }
  }

  // Delete a player
  Future<void> deletePlayer(int playerID) async {
    final response = await http.delete(
      Uri.parse('${ApiConstants.baseUrl}/players/$playerID'),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete player');
    }
  }
}
