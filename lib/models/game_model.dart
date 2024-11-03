import 'package:flutter/material.dart'; // Import the material package

class Game {
  final String gameName;
  final String teamName;
  final String dateAndTimeSchedule;
  final Widget? icon;
  final List<Player> players;

  Game({
    required this.gameName,
    required this.teamName,
    required this.dateAndTimeSchedule,
    this.icon,
    required this.players,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    var playersJson = json['players'] as List;
    List<Player> playersList =
        playersJson.map((playerJson) => Player.fromJson(playerJson)).toList();

    return Game(
      gameName: json['gameName'],
      teamName: json['teamName'],
      dateAndTimeSchedule: json['dateAndTimeSchedule'],
      players: playersList,
    );
  }
}

class Player {
  final String lastName;
  final String firstName;
  final int playerJerseyNumber;
  final Widget? icon;
  final StatisticsCount statisticsCount;

  Player({
    required this.lastName,
    required this.firstName,
    required this.playerJerseyNumber,
    this.icon,
    required this.statisticsCount,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      lastName: json['lastName'],
      firstName: json['firstName'],
      playerJerseyNumber: json['playerJerseyNumber'],
      statisticsCount: StatisticsCount.fromJson(json['statisticsCount']),
    );
  }
}

class StatisticsCount {
  final int points;
  final int rebound;
  final int steal;
  final int block;
  final int turnover;
  final int foul;
  final int assist;

  StatisticsCount({
    required this.points,
    required this.rebound,
    required this.steal,
    required this.block,
    required this.turnover,
    required this.foul,
    required this.assist,
  });

  factory StatisticsCount.fromJson(Map<String, dynamic> json) {
    return StatisticsCount(
      points: json['points'],
      rebound: json['rebound'],
      steal: json['steal'],
      block: json['block'],
      turnover: json['turnover'],
      foul: json['foul'],
      assist: json['assist'],
    );
  }
}

class Team {
  final String teamName;
  final Widget? icon;
  final List<Player> players;

  Team({
    required this.teamName,
    required this.players,
    this.icon,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    var playersJson = json['players'] as List;
    List<Player> playersList =
        playersJson.map((playerJson) => Player.fromJson(playerJson)).toList();

    return Team(
      teamName: json['name'],
      players: playersList,
    );
  }
}

class GameDetails {
  final String gameName;
  final String teamName;
  final String dateAndTimeSchedule;
  final List<Player> players;

  GameDetails({
    required this.gameName,
    required this.teamName,
    required this.dateAndTimeSchedule,
    required this.players,
  });

  factory GameDetails.fromJson(Map<String, dynamic> json) {
    var playersJson = json['players'] as List;
    List<Player> playersList =
        playersJson.map((playerJson) => Player.fromJson(playerJson)).toList();

    return GameDetails(
      gameName: json['gameName'],
      teamName: json['teamName'],
      dateAndTimeSchedule: json['dateAndTimeSchedule'],
      players: playersList,
    );
  }
}
