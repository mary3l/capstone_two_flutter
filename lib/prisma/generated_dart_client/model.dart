// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'model.dart' as _i1;
import 'prisma.dart' as _i2;

class FinalQuarter {
  const FinalQuarter({
    this.id,
    this.number,
    this.gameID,
    this.logs,
    this.game,
    this.playerStatistics,
    this.$count,
  });

  factory FinalQuarter.fromJson(Map json) => FinalQuarter(
        id: json['id'],
        number: json['number'],
        gameID: json['gameID'],
        logs:
            (json['Logs'] as Iterable?)?.map((json) => _i1.Logs.fromJson(json)),
        game: json['game'] is Map ? _i1.Game.fromJson(json['game']) : null,
        playerStatistics: (json['PlayerStatistics'] as Iterable?)
            ?.map((json) => _i1.PlayerStatistics.fromJson(json)),
        $count: json['_count'] is Map
            ? _i2.FinalQuarterCountOutputType.fromJson(json['_count'])
            : null,
      );

  final int? id;

  final int? number;

  final int? gameID;

  final Iterable<_i1.Logs>? logs;

  final _i1.Game? game;

  final Iterable<_i1.PlayerStatistics>? playerStatistics;

  final _i2.FinalQuarterCountOutputType? $count;

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
        'gameID': gameID,
        'Logs': logs?.map((e) => e.toJson()),
        'game': game?.toJson(),
        'PlayerStatistics': playerStatistics?.map((e) => e.toJson()),
        '_count': $count?.toJson(),
      };
}

class Logs {
  const Logs({
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.isValidCombination,
    this.timestamp,
    this.quarterID,
    this.finalQuarterId,
    this.quarter,
    this.finalQuarter,
  });

  factory Logs.fromJson(Map json) => Logs(
        id: json['id'],
        keywordOne: json['keywordOne'],
        keywordTwo: json['keywordTwo'],
        keywordThree: json['keywordThree'],
        isValidCombination: json['isValidCombination'],
        timestamp: switch (json['timestamp']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['timestamp']
        },
        quarterID: json['quarterID'],
        finalQuarterId: json['finalQuarterId'],
        quarter: json['quarter'] is Map
            ? _i1.Quarter.fromJson(json['quarter'])
            : null,
        finalQuarter: json['FinalQuarter'] is Map
            ? _i1.FinalQuarter.fromJson(json['FinalQuarter'])
            : null,
      );

  final int? id;

  final String? keywordOne;

  final String? keywordTwo;

  final String? keywordThree;

  final bool? isValidCombination;

  final DateTime? timestamp;

  final int? quarterID;

  final int? finalQuarterId;

  final _i1.Quarter? quarter;

  final _i1.FinalQuarter? finalQuarter;

  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'isValidCombination': isValidCombination,
        'timestamp': timestamp?.toIso8601String(),
        'quarterID': quarterID,
        'finalQuarterId': finalQuarterId,
        'quarter': quarter?.toJson(),
        'FinalQuarter': finalQuarter?.toJson(),
      };
}

class Quarter {
  const Quarter({
    this.id,
    this.number,
    this.gameID,
    this.logs,
    this.game,
    this.playerStatistics,
    this.$count,
  });

  factory Quarter.fromJson(Map json) => Quarter(
        id: json['id'],
        number: json['number'],
        gameID: json['gameID'],
        logs:
            (json['Logs'] as Iterable?)?.map((json) => _i1.Logs.fromJson(json)),
        game: json['game'] is Map ? _i1.Game.fromJson(json['game']) : null,
        playerStatistics: (json['PlayerStatistics'] as Iterable?)
            ?.map((json) => _i1.PlayerStatistics.fromJson(json)),
        $count: json['_count'] is Map
            ? _i2.QuarterCountOutputType.fromJson(json['_count'])
            : null,
      );

  final int? id;

  final int? number;

  final int? gameID;

  final Iterable<_i1.Logs>? logs;

  final _i1.Game? game;

  final Iterable<_i1.PlayerStatistics>? playerStatistics;

  final _i2.QuarterCountOutputType? $count;

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
        'gameID': gameID,
        'Logs': logs?.map((e) => e.toJson()),
        'game': game?.toJson(),
        'PlayerStatistics': playerStatistics?.map((e) => e.toJson()),
        '_count': $count?.toJson(),
      };
}

class PlayerStatistics {
  const PlayerStatistics({
    this.id,
    this.playerID,
    this.quarterID,
    this.totalScore,
    this.madeOne,
    this.madeTwo,
    this.madeThree,
    this.miss,
    this.rebound,
    this.foul,
    this.turnover,
    this.assist,
    this.block,
    this.steal,
    this.finalQuarterId,
    this.player,
    this.quarter,
    this.finalQuarter,
  });

  factory PlayerStatistics.fromJson(Map json) => PlayerStatistics(
        id: json['id'],
        playerID: json['playerID'],
        quarterID: json['quarterID'],
        totalScore: json['totalScore'],
        madeOne: json['madeOne'],
        madeTwo: json['madeTwo'],
        madeThree: json['madeThree'],
        miss: json['miss'],
        rebound: json['rebound'],
        foul: json['foul'],
        turnover: json['turnover'],
        assist: json['assist'],
        block: json['block'],
        steal: json['steal'],
        finalQuarterId: json['finalQuarterId'],
        player:
            json['player'] is Map ? _i1.Player.fromJson(json['player']) : null,
        quarter: json['quarter'] is Map
            ? _i1.Quarter.fromJson(json['quarter'])
            : null,
        finalQuarter: json['FinalQuarter'] is Map
            ? _i1.FinalQuarter.fromJson(json['FinalQuarter'])
            : null,
      );

  final int? id;

  final int? playerID;

  final int? quarterID;

  final int? totalScore;

  final int? madeOne;

  final int? madeTwo;

  final int? madeThree;

  final int? miss;

  final int? rebound;

  final int? foul;

  final int? turnover;

  final int? assist;

  final int? block;

  final int? steal;

  final int? finalQuarterId;

  final _i1.Player? player;

  final _i1.Quarter? quarter;

  final _i1.FinalQuarter? finalQuarter;

  Map<String, dynamic> toJson() => {
        'id': id,
        'playerID': playerID,
        'quarterID': quarterID,
        'totalScore': totalScore,
        'madeOne': madeOne,
        'madeTwo': madeTwo,
        'madeThree': madeThree,
        'miss': miss,
        'rebound': rebound,
        'foul': foul,
        'turnover': turnover,
        'assist': assist,
        'block': block,
        'steal': steal,
        'finalQuarterId': finalQuarterId,
        'player': player?.toJson(),
        'quarter': quarter?.toJson(),
        'FinalQuarter': finalQuarter?.toJson(),
      };
}

class Player {
  const Player({
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
    this.team,
    this.playerStatistics,
    this.$count,
  });

  factory Player.fromJson(Map json) => Player(
        id: json['id'],
        lastName: json['lastName'],
        firstName: json['firstName'],
        middleName: json['middleName'],
        jerseyNumber: json['jerseyNumber'],
        gamesPlayed: json['gamesPlayed'],
        teamID: json['teamID'],
        team: json['team'] is Map ? _i1.Team.fromJson(json['team']) : null,
        playerStatistics: (json['PlayerStatistics'] as Iterable?)
            ?.map((json) => _i1.PlayerStatistics.fromJson(json)),
        $count: json['_count'] is Map
            ? _i2.PlayerCountOutputType.fromJson(json['_count'])
            : null,
      );

  final int? id;

  final String? lastName;

  final String? firstName;

  final String? middleName;

  final int? jerseyNumber;

  final int? gamesPlayed;

  final int? teamID;

  final _i1.Team? team;

  final Iterable<_i1.PlayerStatistics>? playerStatistics;

  final _i2.PlayerCountOutputType? $count;

  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
        'team': team?.toJson(),
        'PlayerStatistics': playerStatistics?.map((e) => e.toJson()),
        '_count': $count?.toJson(),
      };
}

class Team {
  const Team({
    this.id,
    this.name,
    this.game,
    this.player,
    this.$count,
  });

  factory Team.fromJson(Map json) => Team(
        id: json['id'],
        name: json['name'],
        game:
            (json['Game'] as Iterable?)?.map((json) => _i1.Game.fromJson(json)),
        player: (json['Player'] as Iterable?)
            ?.map((json) => _i1.Player.fromJson(json)),
        $count: json['_count'] is Map
            ? _i2.TeamCountOutputType.fromJson(json['_count'])
            : null,
      );

  final int? id;

  final String? name;

  final Iterable<_i1.Game>? game;

  final Iterable<_i1.Player>? player;

  final _i2.TeamCountOutputType? $count;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'Game': game?.map((e) => e.toJson()),
        'Player': player?.map((e) => e.toJson()),
        '_count': $count?.toJson(),
      };
}

class Game {
  const Game({
    this.id,
    this.title,
    this.againstTeam,
    this.date,
    this.semester,
    this.teamID,
    this.seasonID,
    this.team,
    this.season,
    this.quarter,
    this.finalQuarter,
    this.$count,
  });

  factory Game.fromJson(Map json) => Game(
        id: json['id'],
        title: json['title'],
        againstTeam: json['againstTeam'],
        date: switch (json['date']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['date']
        },
        semester: json['semester'],
        teamID: json['teamID'],
        seasonID: json['seasonID'],
        team: json['team'] is Map ? _i1.Team.fromJson(json['team']) : null,
        season:
            json['season'] is Map ? _i1.Season.fromJson(json['season']) : null,
        quarter: (json['Quarter'] as Iterable?)
            ?.map((json) => _i1.Quarter.fromJson(json)),
        finalQuarter: (json['FinalQuarter'] as Iterable?)
            ?.map((json) => _i1.FinalQuarter.fromJson(json)),
        $count: json['_count'] is Map
            ? _i2.GameCountOutputType.fromJson(json['_count'])
            : null,
      );

  final int? id;

  final String? title;

  final String? againstTeam;

  final DateTime? date;

  final String? semester;

  final int? teamID;

  final int? seasonID;

  final _i1.Team? team;

  final _i1.Season? season;

  final Iterable<_i1.Quarter>? quarter;

  final Iterable<_i1.FinalQuarter>? finalQuarter;

  final _i2.GameCountOutputType? $count;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'againstTeam': againstTeam,
        'date': date?.toIso8601String(),
        'semester': semester,
        'teamID': teamID,
        'seasonID': seasonID,
        'team': team?.toJson(),
        'season': season?.toJson(),
        'Quarter': quarter?.map((e) => e.toJson()),
        'FinalQuarter': finalQuarter?.map((e) => e.toJson()),
        '_count': $count?.toJson(),
      };
}

class Season {
  const Season({
    this.id,
    this.startYear,
    this.endYear,
    this.games,
    this.$count,
  });

  factory Season.fromJson(Map json) => Season(
        id: json['id'],
        startYear: json['startYear'],
        endYear: json['endYear'],
        games: (json['games'] as Iterable?)
            ?.map((json) => _i1.Game.fromJson(json)),
        $count: json['_count'] is Map
            ? _i2.SeasonCountOutputType.fromJson(json['_count'])
            : null,
      );

  final int? id;

  final int? startYear;

  final int? endYear;

  final Iterable<_i1.Game>? games;

  final _i2.SeasonCountOutputType? $count;

  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
        'games': games?.map((e) => e.toJson()),
        '_count': $count?.toJson(),
      };
}

class CreateManySeasonAndReturnOutputType {
  const CreateManySeasonAndReturnOutputType({
    this.id,
    this.startYear,
    this.endYear,
  });

  factory CreateManySeasonAndReturnOutputType.fromJson(Map json) =>
      CreateManySeasonAndReturnOutputType(
        id: json['id'],
        startYear: json['startYear'],
        endYear: json['endYear'],
      );

  final int? id;

  final int? startYear;

  final int? endYear;

  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
      };
}

class CreateManyGameAndReturnOutputType {
  const CreateManyGameAndReturnOutputType({
    this.id,
    this.title,
    this.againstTeam,
    this.date,
    this.semester,
    this.teamID,
    this.seasonID,
    this.team,
    this.season,
  });

  factory CreateManyGameAndReturnOutputType.fromJson(Map json) =>
      CreateManyGameAndReturnOutputType(
        id: json['id'],
        title: json['title'],
        againstTeam: json['againstTeam'],
        date: switch (json['date']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['date']
        },
        semester: json['semester'],
        teamID: json['teamID'],
        seasonID: json['seasonID'],
        team: json['team'] is Map ? _i1.Team.fromJson(json['team']) : null,
        season:
            json['season'] is Map ? _i1.Season.fromJson(json['season']) : null,
      );

  final int? id;

  final String? title;

  final String? againstTeam;

  final DateTime? date;

  final String? semester;

  final int? teamID;

  final int? seasonID;

  final _i1.Team? team;

  final _i1.Season? season;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'againstTeam': againstTeam,
        'date': date?.toIso8601String(),
        'semester': semester,
        'teamID': teamID,
        'seasonID': seasonID,
        'team': team?.toJson(),
        'season': season?.toJson(),
      };
}

class CreateManyQuarterAndReturnOutputType {
  const CreateManyQuarterAndReturnOutputType({
    this.id,
    this.number,
    this.gameID,
    this.game,
  });

  factory CreateManyQuarterAndReturnOutputType.fromJson(Map json) =>
      CreateManyQuarterAndReturnOutputType(
        id: json['id'],
        number: json['number'],
        gameID: json['gameID'],
        game: json['game'] is Map ? _i1.Game.fromJson(json['game']) : null,
      );

  final int? id;

  final int? number;

  final int? gameID;

  final _i1.Game? game;

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
        'gameID': gameID,
        'game': game?.toJson(),
      };
}

class CreateManyLogsAndReturnOutputType {
  const CreateManyLogsAndReturnOutputType({
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.isValidCombination,
    this.timestamp,
    this.quarterID,
    this.finalQuarterId,
    this.quarter,
    this.finalQuarter,
  });

  factory CreateManyLogsAndReturnOutputType.fromJson(Map json) =>
      CreateManyLogsAndReturnOutputType(
        id: json['id'],
        keywordOne: json['keywordOne'],
        keywordTwo: json['keywordTwo'],
        keywordThree: json['keywordThree'],
        isValidCombination: json['isValidCombination'],
        timestamp: switch (json['timestamp']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['timestamp']
        },
        quarterID: json['quarterID'],
        finalQuarterId: json['finalQuarterId'],
        quarter: json['quarter'] is Map
            ? _i1.Quarter.fromJson(json['quarter'])
            : null,
        finalQuarter: json['FinalQuarter'] is Map
            ? _i1.FinalQuarter.fromJson(json['FinalQuarter'])
            : null,
      );

  final int? id;

  final String? keywordOne;

  final String? keywordTwo;

  final String? keywordThree;

  final bool? isValidCombination;

  final DateTime? timestamp;

  final int? quarterID;

  final int? finalQuarterId;

  final _i1.Quarter? quarter;

  final _i1.FinalQuarter? finalQuarter;

  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'isValidCombination': isValidCombination,
        'timestamp': timestamp?.toIso8601String(),
        'quarterID': quarterID,
        'finalQuarterId': finalQuarterId,
        'quarter': quarter?.toJson(),
        'FinalQuarter': finalQuarter?.toJson(),
      };
}

class CreateManyTeamAndReturnOutputType {
  const CreateManyTeamAndReturnOutputType({
    this.id,
    this.name,
  });

  factory CreateManyTeamAndReturnOutputType.fromJson(Map json) =>
      CreateManyTeamAndReturnOutputType(
        id: json['id'],
        name: json['name'],
      );

  final int? id;

  final String? name;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class CreateManyPlayerAndReturnOutputType {
  const CreateManyPlayerAndReturnOutputType({
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
    this.team,
  });

  factory CreateManyPlayerAndReturnOutputType.fromJson(Map json) =>
      CreateManyPlayerAndReturnOutputType(
        id: json['id'],
        lastName: json['lastName'],
        firstName: json['firstName'],
        middleName: json['middleName'],
        jerseyNumber: json['jerseyNumber'],
        gamesPlayed: json['gamesPlayed'],
        teamID: json['teamID'],
        team: json['team'] is Map ? _i1.Team.fromJson(json['team']) : null,
      );

  final int? id;

  final String? lastName;

  final String? firstName;

  final String? middleName;

  final int? jerseyNumber;

  final int? gamesPlayed;

  final int? teamID;

  final _i1.Team? team;

  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
        'team': team?.toJson(),
      };
}

class CreateManyPlayerStatisticsAndReturnOutputType {
  const CreateManyPlayerStatisticsAndReturnOutputType({
    this.id,
    this.playerID,
    this.quarterID,
    this.totalScore,
    this.madeOne,
    this.madeTwo,
    this.madeThree,
    this.miss,
    this.rebound,
    this.foul,
    this.turnover,
    this.assist,
    this.block,
    this.steal,
    this.finalQuarterId,
    this.player,
    this.quarter,
    this.finalQuarter,
  });

  factory CreateManyPlayerStatisticsAndReturnOutputType.fromJson(Map json) =>
      CreateManyPlayerStatisticsAndReturnOutputType(
        id: json['id'],
        playerID: json['playerID'],
        quarterID: json['quarterID'],
        totalScore: json['totalScore'],
        madeOne: json['madeOne'],
        madeTwo: json['madeTwo'],
        madeThree: json['madeThree'],
        miss: json['miss'],
        rebound: json['rebound'],
        foul: json['foul'],
        turnover: json['turnover'],
        assist: json['assist'],
        block: json['block'],
        steal: json['steal'],
        finalQuarterId: json['finalQuarterId'],
        player:
            json['player'] is Map ? _i1.Player.fromJson(json['player']) : null,
        quarter: json['quarter'] is Map
            ? _i1.Quarter.fromJson(json['quarter'])
            : null,
        finalQuarter: json['FinalQuarter'] is Map
            ? _i1.FinalQuarter.fromJson(json['FinalQuarter'])
            : null,
      );

  final int? id;

  final int? playerID;

  final int? quarterID;

  final int? totalScore;

  final int? madeOne;

  final int? madeTwo;

  final int? madeThree;

  final int? miss;

  final int? rebound;

  final int? foul;

  final int? turnover;

  final int? assist;

  final int? block;

  final int? steal;

  final int? finalQuarterId;

  final _i1.Player? player;

  final _i1.Quarter? quarter;

  final _i1.FinalQuarter? finalQuarter;

  Map<String, dynamic> toJson() => {
        'id': id,
        'playerID': playerID,
        'quarterID': quarterID,
        'totalScore': totalScore,
        'madeOne': madeOne,
        'madeTwo': madeTwo,
        'madeThree': madeThree,
        'miss': miss,
        'rebound': rebound,
        'foul': foul,
        'turnover': turnover,
        'assist': assist,
        'block': block,
        'steal': steal,
        'finalQuarterId': finalQuarterId,
        'player': player?.toJson(),
        'quarter': quarter?.toJson(),
        'FinalQuarter': finalQuarter?.toJson(),
      };
}

class CreateManyFinalQuarterAndReturnOutputType {
  const CreateManyFinalQuarterAndReturnOutputType({
    this.id,
    this.number,
    this.gameID,
    this.game,
  });

  factory CreateManyFinalQuarterAndReturnOutputType.fromJson(Map json) =>
      CreateManyFinalQuarterAndReturnOutputType(
        id: json['id'],
        number: json['number'],
        gameID: json['gameID'],
        game: json['game'] is Map ? _i1.Game.fromJson(json['game']) : null,
      );

  final int? id;

  final int? number;

  final int? gameID;

  final _i1.Game? game;

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
        'gameID': gameID,
        'game': game?.toJson(),
      };
}
