import 'package:flutter/material.dart'; // Import the material package

// Model for the Game entity
// class Game {
//   final int id;
//   final String title; // Corresponds to 'gameName'
//   final String team; // Corresponds to 'teamName'
//   final DateTime date; // Corresponds to 'dateAndTimeSchedule'
//   final List<Team> teams; // One-to-many relationship with Team

//   Game({
//     required this.id,
//     required this.title,
//     required this.team,
//     required this.date,
//     required this.teams,
//   });

//   factory Game.fromJson(Map<String, dynamic> json) {
//     var teamsJson = json['teams'] as List;
//     List<Team> teamsList =
//         teamsJson.map((teamJson) => Team.fromJson(teamJson)).toList();

//     return Game(
//       id: json['id'],
//       title: json['title'],
//       team: json['team'],
//       date: DateTime.parse(json['date']),
//       teams: teamsList,
//     );
//   }
// }

class Game {
  final int id;
  final String title;
  final DateTime date;
  final List<Team> teams;

  Game(
      {required this.id,
      required this.title,
      required this.date,
      required this.teams});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'],
      title: json['title'],
      date: DateTime.parse(json['date']),
      teams: (json['teams'] as List)
          .map((teamJson) => Team.fromJson(teamJson))
          .toList(),
    );
  }
}

class Quarter {
  final int id;
  final int quarterNum; // The quarter number (1, 2, 3, 4)
  final int gameId; // The ID of the game this quarter belongs to
  final List<PlayerQuarterStats>
      playerStats; // List of player statistics for this quarter

  Quarter({
    required this.id,
    required this.quarterNum,
    required this.gameId,
    required this.playerStats,
  });

  factory Quarter.fromJson(Map<String, dynamic> json) {
    var statsJson = json['playerStats'] as List;
    List<PlayerQuarterStats> statsList = statsJson
        .map((statsJson) => PlayerQuarterStats.fromJson(statsJson))
        .toList();

    return Quarter(
      id: json['id'],
      quarterNum: json['quarterNum'],
      gameId: json['gameId'],
      playerStats: statsList,
    );
  }
}

// Model for the Team entity
// class Team {
//   final int id;
//   final String name; // Corresponds to 'teamName'
//   final int schoolYear;
//   final String semester;
//   final List<Player> players; // One-to-many relationship with Player

//   Team({
//     required this.id,
//     required this.name,
//     required this.schoolYear,
//     required this.semester,
//     required this.players,
//   });

//   factory Team.fromJson(Map<String, dynamic> json) {
//     var playersJson = json['players'] as List;
//     List<Player> playersList =
//         playersJson.map((playerJson) => Player.fromJson(playerJson)).toList();

//     return Team(
//       id: json['id'],
//       name: json['name'],
//       schoolYear: json['schoolYear'],
//       semester: json['semester'],
//       players: playersList,
//     );
//   }
// }

class Team {
  final int id;
  final String name;
  final int schoolYear;
  final String semester;
  final List<Player> players;

  Team(
      {required this.id,
      required this.name,
      required this.schoolYear,
      required this.semester,
      required this.players});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
      schoolYear: json['schoolYear'],
      semester: json['semester'],
      players: (json['players'] as List)
          .map((playerJson) => Player.fromJson(playerJson))
          .toList(),
    );
  }
}

// Model for the Player entity
class Player {
  final int id;
  final String lastName;
  final String firstName;
  final String middleName;
  final int jerseyNumber; // Corresponds to 'playerJerseyNumber'
  final int gamesPlayed;
  final Statistics statistics; // One-to-one relationship with Statistics

  Player({
    required this.id,
    required this.lastName,
    required this.firstName,
    required this.middleName,
    required this.jerseyNumber,
    required this.gamesPlayed,
    required this.statistics,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      lastName: json['lastName'],
      firstName: json['firstName'],
      middleName: json['middleName'],
      jerseyNumber: json['jerseyNumber'],
      gamesPlayed: json['gamesPlayed'],
      statistics: Statistics.fromJson(json['statistics']),
    );
  }
}

// Model for the Statistics entity
class Statistics {
  final int id;
  final int points;
  final int rebounds; // Corresponds to 'rebound'
  final int fouls; // Corresponds to 'foul'
  final int turnovers; // Corresponds to 'turnover'
  final int assists; // Corresponds to 'assist'
  final int steals; // Corresponds to 'steal'
  final int blocks; // Corresponds to 'block'
  final List<Point> pointsData; // One-to-many relationship with Points

  Statistics({
    required this.id,
    required this.points,
    required this.rebounds,
    required this.fouls,
    required this.turnovers,
    required this.assists,
    required this.steals,
    required this.blocks,
    required this.pointsData,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) {
    var pointsJson = json['pointsData'] as List;
    List<Point> pointsList =
        pointsJson.map((pointJson) => Point.fromJson(pointJson)).toList();

    return Statistics(
      id: json['id'],
      points: json['points'],
      rebounds: json['rebound'],
      fouls: json['foul'],
      turnovers: json['turnover'],
      assists: json['assist'],
      steals: json['steal'],
      blocks: json['block'],
      pointsData: pointsList,
    );
  }
}

// Model for the Points entity
class Point {
  final int id;
  final int madeOne;
  final int madeTwo;
  final int madeThree;
  final int missOne;
  final int missTwo;
  final int missThree;

  Point({
    required this.id,
    required this.madeOne,
    required this.madeTwo,
    required this.madeThree,
    required this.missOne,
    required this.missTwo,
    required this.missThree,
  });

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(
      id: json['id'],
      madeOne: json['madeOne'],
      madeTwo: json['madeTwo'],
      madeThree: json['madeThree'],
      missOne: json['missOne'],
      missTwo: json['missTwo'],
      missThree: json['missThree'],
    );
  }
}
