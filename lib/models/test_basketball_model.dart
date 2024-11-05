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
      'jerseyNumber': jerseyNumber,
      'teamID': teamID,
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
      jerseyNumber: map['jerseyNumber'],
      teamID: map['teamID'],
    );
  }
}

// Stores general information about each season
class Season {
  final int? seasonID;
  final int gameID;
  final int startYear; // year of the season started
  final int endYear; // year of the season ended

  Season(
      {this.seasonID,
      required this.gameID,
      required this.startYear,
      required this.endYear});

  Map<String, dynamic> toMap() {
    return {
      'seasonID': seasonID,
      'gameID': gameID,
      'startYear': startYear,
      'endYear': endYear
    };
  }

  factory Season.fromMap(Map<String, dynamic> map) {
    return Season(
        seasonID: map['seasonID'],
        gameID: map['gameID'],
        startYear: map['startYear'],
        endYear: map['endYear']);
  }
}

// Stores general information about each game
class Game {
  final int? gameID;
  final String gameTitle;
  final DateTime date; // date now of the game
  final String? semester;
  final int? teamID; // TEMPORARILY SETTED TO "?"

  Game(
      {this.gameID,
      required this.date,
      required this.gameTitle,
      this.semester,
      this.teamID}); // TEMPORARILY SETTED TO "?"

  Map<String, dynamic> toMap() {
    return {
      'gameID': gameID,
      'gameTitle': gameTitle,
      'date': date.toIso8601String(), // Convert DateTime to string
      'semester': semester,
      'teamID': teamID
    };
  }

  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
        gameID: map['gameID'],
        gameTitle: map['gameTitle'],
        date: DateTime.parse(map['date']), // Convert back to DateTime
        semester: map['semester'],
        teamID: map['teamID']);
  }
}

class Team {
  final int? teamID;
  final String teamName;

  Team({this.teamID, required this.teamName});

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(teamID: map['teamID'], teamName: map['teamName']);
  }
}

// Stores general information about each quarter of the game
class Quarter {
  final int quarterID;
  final int gameID;
  final int quarterNumber;
  final int quarterScore;

  Quarter({
    required this.quarterID,
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

class PlayerStatistics {
  final int playerStatisticID;
  final int playerID;
  final int gameID;
  final int quarterID;
  final ActionType actionType; // Action performed by the player
  final int? scorePoints; //score poinrs {1,2,3} for actions made and miss

  PlayerStatistics(
      {required this.playerStatisticID,
      required this.gameID,
      required this.playerID,
      required this.quarterID,
      required this.actionType})
      : scorePoints = _mapActionToScore(actionType);

  // Method to calculate score based on action type
  static int _mapActionToScore(ActionType actionType) {
    switch (actionType) {
      case ActionType.madeOne:
        return 1; // Assign 1 point for made one
      case ActionType.madeTwo:
        return 2; // Assign 2 points for made two
      case ActionType.madeThree:
        return 3; // Assign 3 points for made three
      case ActionType.missOne:
        return 0; // No score for miss one
      case ActionType.missTwo:
        return 0; // No score for miss two
      case ActionType.missThree:
        return 0; // No score for miss three
      default:
        return 0; // No score for other actions
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'playerStatisticID': playerStatisticID,
      'gameID': gameID,
      'playerID': playerID,
      'quarterID': quarterID,
      'actionType': actionType,
      'scorePoints': scorePoints,
    };
  }

  factory PlayerStatistics.fromMap(Map<String, dynamic> map) {
    return PlayerStatistics(
      playerStatisticID: map['playerStatisticID'],
      gameID: map['gameID'],
      playerID: map['playerID'],
      quarterID: map['quarterID'],
      actionType: map['actionType'],
    );
  }
}
// possible look of the output
// Statistics stat = Statistics(
//   statID: 1, // or some generated ID
//   playerID: recognizedPlayerID, // ID from voice recognition
//   gameID: currentGameID, // ID of the current game
//   quarterID: currentQuarterID, // ID of the current quarter
//   actionType: 'made', // or 'missed', etc.
//   score: 3, // score can be null if not applicable
// );

// Enum for action types
enum ActionType {
  madeOne, // 1 point made
  madeTwo, // 2 point made
  madeThree, // 3 point made
  missOne, // 1 point miss
  missTwo, // 2 point miss
  missThree, // 3 point miss
  rebound,
  foul,
  turnover,
  assist,
  steal,
  block
}
