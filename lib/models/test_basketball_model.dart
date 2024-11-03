// 0 Assist
// 1 Background Noise
// 2 Block
// 3 Eight
// 4 Five
// 5 Foul
// 6 Four
// 7 Made
// 8 Miss
// 9 Nine
// 10 One
// 11 Player
// 12 Rebound
// 13 Seven
// 14 Six
// 15 Steal
// 16 Ten
// 17 Three
// 18 Turnover
// 19 Two

// Stores general information about each player.
class Player {
  //properties
  final int playerID;
  final String lastName;
  final String firstName;
  final String middleName;
  final int jerseyNumber;
  final int teamID;

  Player(
      {
      // constructor
      required this.playerID,
      required this.lastName,
      required this.firstName,
      required this.middleName,
      required this.jerseyNumber,
      required this.teamID});

  Map<String, dynamic> toMap() {
    // to map method
    // database operations for inserting or updating player records
    // making it easier to store and retrieve
    return {
      'playerID': playerID,
      'lastName': lastName,
      'firstName': firstName,
      'middleName': middleName,
      'jersey_number': jerseyNumber,
      'team_id': teamID,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    // factory constructor that creates a new Player object from a map
    // use for retrieving player data from the database
    // The constructor takes a Map<String, dynamic> as an argument
    // extracts values using their keys, and returns a new Player object initialized with those values

    return Player(
      playerID: map['playerID'],
      lastName: map['lastName'],
      firstName: map['firstName'],
      middleName: map['middleName'],
      jerseyNumber: map['jersey_number'],
      teamID: map['team_id'],
    );
  }
}

// Stores general information about each game
class Game {
  final int gameID;
  final String gameTitle;
  final DateTime date;
  final String semester;
  final int teamID;

  Game(
      {required this.gameID,
      required this.date,
      required this.gameTitle,
      required this.semester,
      required this.teamID});

  Map<String, dynamic> toMap() {
    return {
      'gameID': gameID,
      'gameTitle': gameTitle,
      'date': date,
      'semester': semester,
      'teamID': teamID
    };
  }

  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
        gameID: map['gameID'],
        gameTitle: map['gameTitle'],
        date: map['date'],
        semester: map['semester'],
        teamID: map['teamID']);
  }
}

class Team {
  final int teamID;
  final int teamName;

  Team({required this.teamID, required this.teamName});

  factory Team.fromJson(Map<String, dynamic> map) {
    return Team(teamID: map['teamID'], teamName: map['teamName']);
  }
}

// Stores general information about each quarter of the game
class Quarter {
  final int? quarterID;
  final int gameID;
  final int quarterNumber;
  final int quarterScore;

  Quarter({
    this.quarterID,
    required this.gameID,
    required this.quarterNumber,
    required this.quarterScore,
  });

  Map<String, dynamic> toMap() {
    return {
      'quaterID': quarterID,
      'gameID': gameID,
      'quarterNumber': quarterNumber,
      'quarterScore': quarterScore,
    };
  }

  factory Quarter.fromMap(Map<String, dynamic> map) {
    return Quarter(
        quarterID: map['quaterID'],
        gameID: map['gameID'],
        quarterNumber: map['quarterNumber'],
        quarterScore: map['quarterScore']);
  }
}
