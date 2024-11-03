import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:audio_classification/models/test_basketball_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'basketball_stats.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
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

        await db.execute('''
          CREATE TABLE Games (
            gameID INTEGER PRIMARY KEY,
            gameTitle TEXT,
            date TEXT,
            semester TEXT,
            teamID INTEGER
          )
        ''');

        await db.execute('''
          CREATE TABLE Teams (
            teamID INTEGER PRIMARY KEY,
            teamName TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE Quarters (
            quarterID INTEGER PRIMARY KEY AUTOINCREMENT,
            gameID INTEGER,
            quarterNumber INTEGER,
            quarterScore INTEGER,
            FOREIGN KEY (gameID) REFERENCES Games (gameID)
          )
        ''');
      },
    );
  }

  // Player CRUD Operations
  Future<void> insertPlayer(Player player) async {
    final db = await database;
    await db.insert(
      'Players',
      player.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Player>> getPlayers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Players');
    return List.generate(maps.length, (i) {
      return Player.fromMap(maps[i]);
    });
  }

  Future<void> updatePlayer(Player player) async {
    final db = await database;
    await db.update(
      'Players',
      player.toMap(),
      where: 'playerID = ?',
      whereArgs: [player.playerID],
    );
  }

  Future<void> deletePlayer(int playerID) async {
    final db = await database;
    await db.delete(
      'Players',
      where: 'playerID = ?',
      whereArgs: [playerID],
    );
  }

  // Game CRUD Operations
  Future<void> insertGame(Game game) async {
    final db = await database;
    await db.insert(
      'Games',
      game.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Game>> getGames() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Games');
    return List.generate(maps.length, (i) {
      return Game.fromMap(maps[i]);
    });
  }

  Future<void> updateGame(Game game) async {
    final db = await database;
    await db.update(
      'Games',
      game.toMap(),
      where: 'gameID = ?',
      whereArgs: [game.gameID],
    );
  }

  Future<void> deleteGame(int gameID) async {
    final db = await database;
    await db.delete(
      'Games',
      where: 'gameID = ?',
      whereArgs: [gameID],
    );
  }

  // Team CRUD Operations
  Future<void> insertTeam(Team team) async {
    final db = await database;
    await db.insert(
      'Teams',
      {'teamID': team.teamID, 'teamName': team.teamName}, // Adjusted for Team
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Team>> getTeams() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Teams');
    return List.generate(maps.length, (i) {
      return Team.fromJson(maps[i]);
    });
  }

  Future<void> updateTeam(Team team) async {
    final db = await database;
    await db.update(
      'Teams',
      {'teamID': team.teamID, 'teamName': team.teamName}, // Adjusted for Team
      where: 'teamID = ?',
      whereArgs: [team.teamID],
    );
  }

  Future<void> deleteTeam(int teamID) async {
    final db = await database;
    await db.delete(
      'Teams',
      where: 'teamID = ?',
      whereArgs: [teamID],
    );
  }

  // Quarter CRUD Operations
  Future<void> insertQuarter(Quarter quarter) async {
    final db = await database;
    await db.insert(
      'Quarters',
      quarter.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Quarter>> getQuarters() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Quarters');
    return List.generate(maps.length, (i) {
      return Quarter.fromMap(maps[i]);
    });
  }

  Future<void> updateQuarter(Quarter quarter) async {
    final db = await database;
    await db.update(
      'Quarters',
      quarter.toMap(),
      where: 'quarterID = ?',
      whereArgs: [quarter.quarterID],
    );
  }

  Future<void> deleteQuarter(int quarterID) async {
    final db = await database;
    await db.delete(
      'Quarters',
      where: 'quarterID = ?',
      whereArgs: [quarterID],
    );
  }
}
