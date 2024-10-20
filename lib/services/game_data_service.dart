import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:capstone_two_one/models/game_model.dart';

Future<List<Game>> loadGameData() async {
  final String response = await rootBundle.loadString('lib/data/gameData.json');
  final List<dynamic> data = json.decode(response);
  return data.map((game) => Game.fromJson(game)).toList();
}
