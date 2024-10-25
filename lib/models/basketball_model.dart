import 'dart:convert';
import 'package:flutter/services.dart'; // for rootBundle

class Season {
  final String? id; // Unique identifier for the season
  final int? year;
  final List<Game>? games;

  Season({this.id, this.year, this.games});

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      id: json['id'],
      year: json['year'],
      games:
          (json['games'] as List?)?.map((game) => Game.fromJson(game)).toList(),
    );
  }
}

class Game {
  final String? gameId;
  final String? title;
  final DateTime? date;
  final String? semester;
  final int totalPoints;
  final List<Team>? teams;

  Game({
    this.gameId,
    this.title,
    this.date,
    this.semester,
    this.totalPoints = 0, // Default value for totalPoints
    this.teams,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      gameId: json['gameId'],
      title: json['title'],
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      semester: json['semester'],
      totalPoints: json['totalPoints'] ?? 0, // Default value if not provided
      teams:
          (json['teams'] as List?)?.map((team) => Team.fromJson(team)).toList(),
    );
  }
}

class Team {
  final String? teamId;
  final String? name;
  final List<Player>? players;

  Team({this.teamId, this.name, this.players});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      teamId: json['teamId'],
      name: json['name'],
      players: (json['players'] as List?)
          ?.map((player) => Player.fromJson(player))
          .toList(),
    );
  }
}

class Player {
  final String? playerId;
  final String? lastName;
  final String? firstName;
  final String? middleName;
  final int? jerseyNumber;
  final int? gamesPlayed;
  final Statistics? statistics;
  final List<PointsBreakdown>? pointsBreakdown;

  Player({
    this.playerId,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.statistics,
    this.pointsBreakdown,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      playerId: json['playerId'],
      lastName: json['lastName'],
      firstName: json['firstName'],
      middleName: json['middleName'],
      jerseyNumber: json['jerseyNumber'],
      gamesPlayed: json['gamesPlayed'],
      statistics: json['statistics'] != null
          ? Statistics.fromJson(json['statistics'])
          : null,
      pointsBreakdown: (json['pointsBreakdown'] as List?)
          ?.map((breakdown) => PointsBreakdown.fromJson(breakdown))
          .toList(),
    );
  }
}

class Statistics {
  final int totalPoints; // Total points for the season
  final int totalRebounds; // Total rebounds for the season
  final int totalSteals; // Total steals for the season
  final int totalBlocks; // Total blocks for the season
  final int totalTurnovers; // Total turnovers for the season
  final int totalFouls; // Total fouls for the season
  final int totalAssists; // Total assists for the season
  final GameBreakdown? gameBreakdown;

  Statistics({
    this.totalPoints = 0, // Default value
    this.totalRebounds = 0, // Default value
    this.totalSteals = 0, // Default value
    this.totalBlocks = 0, // Default value
    this.totalTurnovers = 0, // Default value
    this.totalFouls = 0, // Default value
    this.totalAssists = 0, // Default value
    this.gameBreakdown,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      totalPoints: json['totalPoints'] ?? 0,
      totalRebounds: json['totalRebounds'] ?? 0,
      totalSteals: json['totalSteals'] ?? 0,
      totalBlocks: json['totalBlocks'] ?? 0,
      totalTurnovers: json['totalTurnovers'] ?? 0,
      totalFouls: json['totalFouls'] ?? 0,
      totalAssists: json['totalAssists'] ?? 0,
      gameBreakdown: json['gameBreakdown'] != null
          ? GameBreakdown.fromJson(json['gameBreakdown'])
          : null,
    );
  }
}

class GameBreakdown {
  final String? gameId;
  final int? totalPoints; // Points scored in this game
  final int? totalRebounds; // Rebounds in this game
  final int? totalSteals; // Steals in this game
  final int? totalBlocks; // Blocks in this game
  final int? totalTurnovers; // Turnovers in this game
  final int? totalFouls; // Fouls in this game
  final int? totalAssists; // Assists in this game
  final List<PointsBreakdown>? pointsBreakdown;

  GameBreakdown({
    this.gameId,
    this.totalPoints, // Default value
    this.totalRebounds, // Default value
    this.totalSteals, // Default value
    this.totalBlocks, // Default value
    this.totalTurnovers, // Default value
    this.totalFouls, // Default value
    this.totalAssists, // Default value
    this.pointsBreakdown,
  });

  factory GameBreakdown.fromJson(Map<String, dynamic> json) {
    return GameBreakdown(
      gameId: json['gameId'],
      totalPoints: json['totalPoints'] ?? 0,
      totalRebounds: json['totalRebounds'] ?? 0,
      totalSteals: json['totalSteals'] ?? 0,
      totalBlocks: json['totalBlocks'] ?? 0,
      totalTurnovers: json['totalTurnovers'] ?? 0,
      totalFouls: json['totalFouls'] ?? 0,
      totalAssists: json['totalAssists'] ?? 0,
      pointsBreakdown: (json['pointsBreakdown'] as List?)
          ?.map((breakdown) => PointsBreakdown.fromJson(breakdown))
          .toList(),
    );
  }
}

class PointsBreakdown {
  final String? breakdownId;
  final int? madeOne;
  final int? madeTwo;
  final int? madeThree;
  final int? missOne;
  final int? missTwo;
  final int? missThree;
  final String? quarterID;

  PointsBreakdown({
    this.breakdownId,
    this.madeOne, // Default value
    this.madeTwo, // Default value
    this.madeThree, // Default value
    this.missOne, // Default value
    this.missTwo, // Default value
    this.missThree, // Default value
    this.quarterID,
  });

  factory PointsBreakdown.fromJson(Map<String, dynamic> json) {
    return PointsBreakdown(
      breakdownId: json['breakdownId'],
      madeOne: json['madeOne'] ?? 0,
      madeTwo: json['madeTwo'] ?? 0,
      madeThree: json['madeThree'] ?? 0,
      missOne: json['missOne'] ?? 0,
      missTwo: json['missTwo'] ?? 0,
      missThree: json['missThree'] ?? 0,
      quarterID: json['quarterID'],
    );
  }
}
