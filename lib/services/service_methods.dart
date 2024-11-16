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
      print('Successfully created season');
    } catch (e) {
      print('Failed to create season: $e');
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
      print('Successfully deleted season');
    } catch (e) {
      print('Failed to delete season: $e');
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
      String semester, int teamID) async {
    try {
      // Debugging: Check if teamID is null
      if (teamID == null) {
        print('Team ID is null, no team will be associated with this game.');
      } else {
        print('Team ID is provided: $teamID');
      }

      // Attempt to create the game
      await prisma.game.create(
        data: PrismaUnion.$1(
          GameCreateInput(
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
      print('Game created successfully');
    } catch (e) {
      print('Error creating game: $e');
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
  // Future<List<Game>> fetchGamesBySeasonID(int seasonID) async {
  //   try {
  //     final games =
  //         await prisma.game.findMany(where: GameWhereInput(seasonID: seasonID));
  //     log('Successfully fetched games for season $seasonID');
  //     return games.toList();
  //   } catch (e) {
  //     log('Failed to fetch games by season ID: $e');
  //     return [];
  //   }
  // }

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
      print('Successfully created team');
    } catch (e) {
      print('Failed to create team: $e');
    }
  }

// -------------------- Players ---------------------------
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
      print('Successfully created team');
    } catch (e) {
      print('Failed to create team: $e');
    }
  }
}
