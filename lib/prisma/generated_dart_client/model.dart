// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'model.dart' as _i1;
import 'prisma.dart' as _i2;

class Season {
  const Season({
    this.id,
    this.startYear,
    this.endYear,
  });

  factory Season.fromJson(Map json) => Season(
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
    this.date,
    this.semester,
    this.teamID,
    this.team,
  });

  factory Game.fromJson(Map json) => Game(
        id: json['id'],
        title: json['title'],
        date: switch (json['date']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['date']
        },
        semester: json['semester'],
        teamID: json['teamID'],
        team: json['team'] is Map ? _i1.Team.fromJson(json['team']) : null,
      );

  final int? id;

  final String? title;

  final DateTime? date;

  final String? semester;

  final int? teamID;

  final _i1.Team? team;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date?.toIso8601String(),
        'semester': semester,
        'teamID': teamID,
        'team': team?.toJson(),
      };
}

class CreateManyGameAndReturnOutputType {
  const CreateManyGameAndReturnOutputType({
    this.id,
    this.title,
    this.date,
    this.semester,
    this.teamID,
    this.team,
  });

  factory CreateManyGameAndReturnOutputType.fromJson(Map json) =>
      CreateManyGameAndReturnOutputType(
        id: json['id'],
        title: json['title'],
        date: switch (json['date']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['date']
        },
        semester: json['semester'],
        teamID: json['teamID'],
        team: json['team'] is Map ? _i1.Team.fromJson(json['team']) : null,
      );

  final int? id;

  final String? title;

  final DateTime? date;

  final String? semester;

  final int? teamID;

  final _i1.Team? team;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date?.toIso8601String(),
        'semester': semester,
        'teamID': teamID,
        'team': team?.toJson(),
      };
}

class Quarter {
  const Quarter({
    this.id,
    this.number,
    this.totalScore,
    this.madeOne,
    this.madeTwo,
    this.madeThree,
    this.miss,
    this.reboundOffensive,
    this.reboundDefensive,
    this.foul,
    this.turnover,
    this.assist,
    this.block,
    this.steal,
  });

  factory Quarter.fromJson(Map json) => Quarter(
        id: json['id'],
        number: json['number'],
        totalScore: json['totalScore'],
        madeOne: json['madeOne'],
        madeTwo: json['madeTwo'],
        madeThree: json['madeThree'],
        miss: json['miss'],
        reboundOffensive: json['reboundOffensive'],
        reboundDefensive: json['reboundDefensive'],
        foul: json['foul'],
        turnover: json['turnover'],
        assist: json['assist'],
        block: json['block'],
        steal: json['steal'],
      );

  final int? id;

  final int? number;

  final int? totalScore;

  final int? madeOne;

  final int? madeTwo;

  final int? madeThree;

  final int? miss;

  final int? reboundOffensive;

  final int? reboundDefensive;

  final int? foul;

  final int? turnover;

  final int? assist;

  final int? block;

  final int? steal;

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
        'totalScore': totalScore,
        'madeOne': madeOne,
        'madeTwo': madeTwo,
        'madeThree': madeThree,
        'miss': miss,
        'reboundOffensive': reboundOffensive,
        'reboundDefensive': reboundDefensive,
        'foul': foul,
        'turnover': turnover,
        'assist': assist,
        'block': block,
        'steal': steal,
      };
}

class CreateManyQuarterAndReturnOutputType {
  const CreateManyQuarterAndReturnOutputType({
    this.id,
    this.number,
    this.totalScore,
    this.madeOne,
    this.madeTwo,
    this.madeThree,
    this.miss,
    this.reboundOffensive,
    this.reboundDefensive,
    this.foul,
    this.turnover,
    this.assist,
    this.block,
    this.steal,
  });

  factory CreateManyQuarterAndReturnOutputType.fromJson(Map json) =>
      CreateManyQuarterAndReturnOutputType(
        id: json['id'],
        number: json['number'],
        totalScore: json['totalScore'],
        madeOne: json['madeOne'],
        madeTwo: json['madeTwo'],
        madeThree: json['madeThree'],
        miss: json['miss'],
        reboundOffensive: json['reboundOffensive'],
        reboundDefensive: json['reboundDefensive'],
        foul: json['foul'],
        turnover: json['turnover'],
        assist: json['assist'],
        block: json['block'],
        steal: json['steal'],
      );

  final int? id;

  final int? number;

  final int? totalScore;

  final int? madeOne;

  final int? madeTwo;

  final int? madeThree;

  final int? miss;

  final int? reboundOffensive;

  final int? reboundDefensive;

  final int? foul;

  final int? turnover;

  final int? assist;

  final int? block;

  final int? steal;

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
        'totalScore': totalScore,
        'madeOne': madeOne,
        'madeTwo': madeTwo,
        'madeThree': madeThree,
        'miss': miss,
        'reboundOffensive': reboundOffensive,
        'reboundDefensive': reboundDefensive,
        'foul': foul,
        'turnover': turnover,
        'assist': assist,
        'block': block,
        'steal': steal,
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
