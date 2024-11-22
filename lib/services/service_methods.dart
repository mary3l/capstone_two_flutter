import 'dart:developer';
import 'package:audio_classification/prisma/generated_dart_client/client.dart';
import 'package:audio_classification/prisma/generated_dart_client/prisma.dart';
import 'package:audio_classification/prisma/generated_dart_client/model.dart';
import 'package:audio_classification/helper/prisma.dart';
import 'package:orm/orm.dart';

class ServiceMethod {
// -------------------- Seasons ---------------------------
// creating season w/o gameID
// for landing page - _showAddSeasonDialog
  Future<void> createSeason(int startYear, int endYear) async {
    try {
      await prisma.season.create(
        data: PrismaUnion.$1(
          SeasonCreateInput(
            startYear: startYear,
            endYear: endYear,
          ),
        ),
      );
      log('Successfully created season');
    } catch (e) {
      log('Failed to create season: $e');
    }
  }

  Future<void> updateSeason(int newStartYear, int newEndYear) async {
    // Insert update code here
  }

  Future<void> deleteSeason(int id) async {
    try {
      await prisma.season.delete(
        where: SeasonWhereUniqueInput(id: id),
      );
      log('Successfully deleted season');
    } catch (e) {
      log('Failed to delete season: $e');
    }
  }

  Future<List<Season>> fetchSeasons() async {
    try {
      final seasons = await prisma.season.findMany();
      log('Successfully fetched seasons');
      return seasons.toList(); // Convert the result to List<Season>
    } catch (e) {
      log('Failed to fetch seasons: $e');
      return []; // Return an empty list in case of an error
    }
  }

// -------------------- Games ---------------------------

// creating season w/o gameID
  Future<void> createGame(int seasonID, String title, DateTime date,
      String semester, int teamID, String againstTeam) async {
    try {
      // Debugging: Check if teamID is null
      if (teamID == null) {
        log('Team ID is null, no team will be associated with this game.');
      } else {
        log('Team ID is provided: $teamID');
      }

      // Attempt to create the game
      await prisma.game.create(
        data: PrismaUnion.$1(
          GameCreateInput(
            againstTeam: againstTeam,
            title: title,
            date: date,
            semester: semester,
            team: teamID != null
                ? TeamCreateNestedOneWithoutGameInput(
                    connect: TeamWhereUniqueInput(id: teamID),
                  )
                : null, // Null if no teamID is provided
            season: SeasonCreateNestedOneWithoutGamesInput(
              connect: SeasonWhereUniqueInput(id: seasonID),
            ),
          ),
        ),
      );
      log('Game created successfully');
    } catch (e) {
      log('Error creating game: $e');
    }
  }

  Future<List<Game>> fetchGames() async {
    try {
      final games = await prisma.game.findMany();
      log('Successfully fetched games');
      return games.toList(); // Convert the result to List<Game>
    } catch (e) {
      log('Failed to fetch seasons: $e');
      return []; // Return an empty list in case of an error
    }
  }

//fetch according to seasonID
  Future<List<Game>> fetchGamesBySeasonID(int seasonID) async {
    try {
      final games = await prisma.game.findMany(
          where: GameWhereInput(
              seasonID:
                  PrismaUnion.$1(IntFilter(equals: PrismaUnion.$1(seasonID)))));
      log('Successfully fetched games for season $seasonID');
      return games.toList();
    } catch (e) {
      log('Failed to fetch games by season ID: $e');
      return [];
    }
  }

  Future<void> deleteGame(int id) async {
    try {
      await prisma.game.delete(
        where: GameWhereUniqueInput(id: id),
      );
      log('Successfully deleted game');
    } catch (e) {
      log('Failed to delete game: $e');
    }
  }

  Future<void> deleteAllGame() async {
    try {
      await prisma.game.deleteMany();
      log('Successfully deleted all games');
    } catch (e) {
      log('Failed to delete all games: $e');
    }
  }

// -------------------- Teams ---------------------------
  Future<List<Team>> fetchTeams() async {
    try {
      final teams = await prisma.team.findMany();
      log('Successfully fetched teams');
      return teams.toList();
    } catch (e) {
      log('Failed to fetch teams: $e');
      return []; // Return an empty list in case of an error
    }
  }

// fetch teams according to seasonID inside game
  Future<List<Team>> fetchTeamsForSeason(int seasonID) async {
    try {
      final teams = await prisma.team.findMany(
        where: TeamWhereInput(
          game: GameListRelationFilter(
            some: GameWhereInput(
              seasonID: PrismaUnion.$1(
                IntFilter(equals: PrismaUnion.$1(seasonID)),
              ),
            ),
          ),
        ),
      );

      // Log the results for debugging
      log('Successfully fetched teams for season with ID: $seasonID');
      log('Teams: $teams'); // Log the fetched teams

      return teams.toList(); // Return the fetched teams
    } catch (e) {
      log('Error fetching teams for season: $e');
      return []; // Return an empty list in case of error
    }
  }

// fetch teams according to semester [first, second] inside game
  Future<List<Team>> fetchTeamsForSemester(String semester) async {
    try {
      final teams = await prisma.team.findMany(
        where: TeamWhereInput(
          game: GameListRelationFilter(
            some: GameWhereInput(
                semester: PrismaUnion.$1(
                    StringFilter(equals: PrismaUnion.$1(semester)))),
          ),
        ),
      );

      // Log the results for debugging
      log('Successfully fetched teams with semester: $semester');
      log('Teams: $teams'); // Log the fetched teams

      return teams.toList(); // Return the fetched teams
    } catch (e) {
      log('Error fetching teams for semester: $e');
      return []; // Return an empty list in case of error
    }
  }

  Future<void> createTeam(String name, List<int> playerID) async {
    try {
      await prisma.team.create(
        data: PrismaUnion.$1(
          TeamCreateInput(
            name: name,
            player: PlayerCreateNestedManyWithoutTeamInput(
              connect: PrismaUnion.$2(
                playerID.map((id) => PlayerWhereUniqueInput(id: id)).toList(),
              ),
            ),
          ),
        ),
      );
      log('Successfully created team');
    } catch (e) {
      log('Failed to create team: $e');
    }
  }

// -------------------- Players ---------------------------
// fetch all players
  Future<List<Player>> fetchPlayers() async {
    try {
      final players = await prisma.player.findMany();
      log('Successfully fetched players');
      return players.toList();
    } catch (e) {
      log('Failed to fetch players: $e');
      return []; // Return an empty list in case of an error
    }
  }

  //fetch players according to teamID
  Future<List<Player>> fetchPlayersByTeamId(int teamID) async {
    try {
      final players = await prisma.player.findMany(
        where: PlayerWhereInput(
            teamID: PrismaUnion.$1(
                IntNullableFilter(equals: PrismaUnion.$1(teamID)))),
      );
      log('Successfully fetched players for team with ID: $teamID');

      // Log each player with their ID and the team ID
      for (var player in players) {
        log('Fetched Player ID: ${player.id}, Team ID: $teamID');
      }

      return players.toList();
    } catch (e) {
      log('Failed to fetch players for team with ID: $teamID. Error: $e');
      return []; // Return an empty list in case of an error
    }
  }

  // make players without teamID and gamesPlayed
  Future<void> createPlayer(String lastName, String firstName,
      String middleName, int jerseyNumber) async {
    try {
      await prisma.player.create(
        data: PrismaUnion.$1(PlayerCreateInput(
          lastName: lastName,
          firstName: firstName,
          middleName: middleName,
          jerseyNumber: jerseyNumber,
        )),
      );
      log('Successfully created team');
    } catch (e) {
      log('Failed to create team: $e');
    }
  }
}

// -------------------- Logs ---------------------------
// fetch all logs
Future<List<Logs>> fetchLogs() async {
  try {
    final logs = await prisma.logs.findMany();
    log('Successfully fetched logs');
    return logs.toList();
  } catch (e) {
    log('Failed to fetch logs: $e');
    return []; // Return an empty list in case of an error
  }
}

// --------------- Player Statistics -----------------
// Fetch player statistics according to gameID inside the quarter
// Future<List<PlayerStatistics>> fetchPlayerStatisticsForGame(int gameID) async {
//   try {
//     final playerStatistics = await prisma.playerStatistics.findMany(
//       where: PlayerStatisticsWhereInput(
//         quarter: PrismaUnion.$1(QuarterRelationFilter())
        
//         // QuarterWhereInput(
//         //   gameID: PrismaUnion.$1(gameID),
//           //   (equals: PrismaUnion.$1(gameID)),
//           // ),
//         ),
//       ),
//     );

//     // Log the results for debugging
//     log('Successfully fetched player statistics for game with ID: $gameID');
//     log('Player Statistics: $playerStatistics'); // Log the fetched player statistics

//     return playerStatistics.toList(); // Return the fetched player statistics
//   } catch (e) {
//     log('Error fetching player statistics for game: $e');
//     return []; // Return an empty list in case of error
//   }
// }

// fetch teams according to seasonID inside game
// Future<List<Team>> fetchTeamsForSeason(int seasonID) async {
//   try {
//     final teams = await prisma.team.findMany(
//       where: TeamWhereInput(
//         game: GameListRelationFilter(
//           some: GameWhereInput(
//             seasonID: PrismaUnion.$1(
//               IntFilter(equals: PrismaUnion.$1(seasonID)),
//             ),
//           ),
//         ),
//       ),
//     );

//     // Log the results for debugging
//     log('Successfully fetched teams for season with ID: $seasonID');
//     log('Teams: $teams'); // Log the fetched teams

//     return teams.toList(); // Return the fetched teams
//   } catch (e) {
//     log('Error fetching teams for season: $e');
//     return []; // Return an empty list in case of error
//   }
// }
