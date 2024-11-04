import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:audio_classification/models/test_basketball_model.dart';

// A singleton class to manage the SQLite database connection and operations.
class DatabaseHelper {
  // Private constructor for singleton pattern.
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  // Factory constructor to return the same instance of DatabaseHelper.
  factory DatabaseHelper() => _instance;

  // Internal constructor for initialization.
  DatabaseHelper._internal();

  // Variable to hold the database instance.
  static Database? _database;

  // Getter for the database instance, initializing it if necessary.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initializes the database, creating the database file and tables.
  Future<Database> _initDatabase() async {
    // Construct the database path.
    String path = join(await getDatabasesPath(), 'basketball_stats.db');
    // Open the database and create tables if they don't exist.
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Create the Players table.
        await db.execute('''
          CREATE TABLE Players (
            playerID INTEGER PRIMARY KEY,
            lastName TEXT,
            firstName TEXT,
            middleName TEXT,
            jersey_number INTEGER,
            team_id INTEGER
          )
        ''');

        // Creates Seasons table with seasonID as primary key
        await db.execute('''
      CREATE TABLE Seasons (
        seasonID INTEGER PRIMARY KEY,
        startYear INTEGER NOT NULL,
        endYear INTEGER NOT NULL
      )
    ''');

        // Create the Games table.
        await db.execute('''
          CREATE TABLE Games (
            gameID INTEGER PRIMARY KEY,
            gameTitle TEXT,
            date TEXT,
            semester TEXT,
            teamID INTEGER
            seasonID INTEGER,
            FOREIGN KEY (seasonID) REFERENCES Seasons (seasonID)
            
          )
        ''');

        // Create the Teams table.
        await db.execute('''
          CREATE TABLE Teams (
            teamID INTEGER PRIMARY KEY,
            teamName TEXT
          )
        ''');

        // Create the Quarters table.
        await db.execute('''
          CREATE TABLE Quarters (
            quarterID INTEGER PRIMARY KEY AUTOINCREMENT,
            gameID INTEGER,
            quarterNumber INTEGER,
            quarterScore INTEGER,
            FOREIGN KEY (gameID) REFERENCES Games (gameID)
          )
        ''');

        // Create the PlayerStatistics table.
        await db.execute('''
          CREATE TABLE PlayerStatistics (
            playerStatisticID INTEGER PRIMARY KEY AUTOINCREMENT,
            playerID INTEGER,
            gameID INTEGER,
            quarterID INTEGER,
            actionType INTEGER,
            scorePoints INTEGER,
            FOREIGN KEY (playerID) REFERENCES Players (playerID),
            FOREIGN KEY (gameID) REFERENCES Games (gameID),
            FOREIGN KEY (quarterID) REFERENCES Quarters (quarterID)
          )
        ''');
      },
    );
  }

  // Player CRUD Operations
  // Insert a new player into the database.
  Future<void> insertPlayer(Player player) async {
    final db = await database;
    await db.insert(
      'Players',
      player.toMap(), // Convert player object to map for database insertion.
      conflictAlgorithm: ConflictAlgorithm.replace, // Replace on conflict.
    );
  }

  // Retrieve all players from the database.
  Future<List<Player>> getPlayers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Players');
    return List.generate(maps.length, (i) {
      return Player.fromMap(maps[i]); // Convert map to Player object.
    });
  }

  // Update an existing player in the database.
  Future<void> updatePlayer(Player player) async {
    final db = await database;
    await db.update(
      'Players',
      player.toMap(), // Convert player object to map for updating.
      where: 'playerID = ?', // Specify which player to update.
      whereArgs: [player.playerID],
    );
  }

  // Delete a player from the database by ID.
  Future<void> deletePlayer(int playerID) async {
    final db = await database;
    await db.delete(
      'Players',
      where: 'playerID = ?', // Specify which player to delete.
      whereArgs: [playerID],
    );
  }

  // Game CRUD Operations
  // Insert a new game into the database.
  Future<void> insertGame(Game game) async {
    final db = await database;
    await db.insert(
      'Games',
      game.toMap(), // Convert game object to map for insertion.
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all games from the database.
  Future<List<Game>> getGames() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Games');
    return List.generate(maps.length, (i) {
      return Game.fromMap(maps[i]); // Convert map to Game object.
    });
  }

  // Update an existing game in the database.
  Future<void> updateGame(Game game) async {
    final db = await database;
    await db.update(
      'Games',
      game.toMap(), // Convert game object to map for updating.
      where: 'gameID = ?', // Specify which game to update.
      whereArgs: [game.gameID],
    );
  }

  // Delete a game from the database by ID.
  Future<void> deleteGame(int gameID) async {
    final db = await database;
    await db.delete(
      'Games',
      where: 'gameID = ?', // Specify which game to delete.
      whereArgs: [gameID],
    );
  }

  // Team CRUD Operations
  // Insert a new team into the database.
  Future<void> insertTeam(Team team) async {
    final db = await database;
    await db.insert(
      'Teams',
      {
        'teamID': team.teamID,
        'teamName': team.teamName
      }, // Direct map literal for team.
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all teams from the database.
  Future<List<Team>> getTeams() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Teams');
    return List.generate(maps.length, (i) {
      return Team.fromMap(maps[i]); // Convert map to Team object.
    });
  }

  // Update an existing team in the database.
  Future<void> updateTeam(Team team) async {
    final db = await database;
    await db.update(
      'Teams',
      {
        'teamID': team.teamID,
        'teamName': team.teamName
      }, // Direct map literal for updating.
      where: 'teamID = ?', // Specify which team to update.
      whereArgs: [team.teamID],
    );
  }

  // Delete a team from the database by ID.
  Future<void> deleteTeam(int teamID) async {
    final db = await database;
    await db.delete(
      'Teams',
      where: 'teamID = ?', // Specify which team to delete.
      whereArgs: [teamID],
    );
  }

  // Quarter CRUD Operations
  // Insert a new quarter into the database.
  Future<void> insertQuarter(Quarter quarter) async {
    final db = await database;
    await db.insert(
      'Quarters',
      quarter.toMap(), // Convert quarter object to map for insertion.
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all quarters from the database.
  Future<List<Quarter>> getQuarters() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Quarters');
    return List.generate(maps.length, (i) {
      return Quarter.fromMap(maps[i]); // Convert map to Quarter object.
    });
  }

  // Update an existing quarter in the database.
  Future<void> updateQuarter(Quarter quarter) async {
    final db = await database;
    await db.update(
      'Quarters',
      quarter.toMap(), // Convert quarter object to map for updating.
      where: 'quarterID = ?', // Specify which quarter to update.
      whereArgs: [quarter.quarterID],
    );
  }

  // Delete a quarter from the database by ID.
  Future<void> deleteQuarter(int quarterID) async {
    final db = await database;
    await db.delete(
      'Quarters',
      where: 'quarterID = ?', // Specify which quarter to delete.
      whereArgs: [quarterID],
    );
  }

  // PlayerStatistics CRUD Operations
  // Insert new player statistics into the database.
  Future<void> insertPlayerStatistics(PlayerStatistics stats) async {
    final db = await database;
    await db.insert(
      'PlayerStatistics',
      stats.toMap(), // Convert statistics object to map for insertion.
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all player statistics from the database.
  Future<List<PlayerStatistics>> getPlayerStatistics() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('PlayerStatistics');
    return List.generate(maps.length, (i) {
      return PlayerStatistics.fromMap(
          maps[i]); // Convert map to PlayerStatistics object.
    });
  }

  // Update existing player statistics in the database.
  Future<void> updatePlayerStatistics(PlayerStatistics stats) async {
    final db = await database;
    await db.update(
      'PlayerStatistics',
      stats.toMap(), // Convert statistics object to map for updating.
      where: 'playerStatisticID = ?', // Specify which statistics to update.
      whereArgs: [stats.playerStatisticID],
    );
  }

  // Delete player statistics from the database by ID.
  Future<void> deletePlayerStatistics(int playerStatisticID) async {
    final db = await database;
    await db.delete(
      'PlayerStatistics',
      where: 'playerStatisticID = ?', // Specify which statistics to delete.
      whereArgs: [playerStatisticID],
    );
  }

  // Season CRUD Operations
  // Inserts a new Season record into the Seasons table
  Future<void> insertSeason(Season season) async {
    final db = await database;
    await db.insert(
      'Seasons',
      season.toMap(), // Convert Season object to map for insertion.
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all player statistics from the database.
  Future<List<Season>> getSeasons() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Seasons');
    return List.generate(maps.length, (i) {
      return Season.fromMap(maps[i]); // Convert map to Seasons object.
    });
  }

  // Update existing Season in the database.
  Future<void> updateSeasons(Season season) async {
    final db = await database;
    await db.update(
      'Seasons',
      season.toMap(), // Convert Season object to map for updating.
      where: 'seasonID = ?', // Specify which Season to update.
      whereArgs: [season.seasonID],
    );
  }

  // Delete Season from the database by ID.
  Future<void> deleteSeasons(int seasonID) async {
    final db = await database;
    await db.delete(
      'Seasons',
      where: 'seasonID = ?', // Specify which Season to delete.
      whereArgs: [seasonID],
    );
  }
}
