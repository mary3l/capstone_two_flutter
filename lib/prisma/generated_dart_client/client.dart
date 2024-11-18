// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:orm/dmmf.dart' as _i4;
import 'package:orm/orm.dart' as _i1;
import 'package:orm_flutter/orm_flutter.dart' as _i5;

import 'model.dart' as _i2;
import 'prisma.dart' as _i3;

class SeasonDelegate {
  const SeasonDelegate._(this._client);

  final PrismaClient _client;

  _i1.ActionClient<_i2.Season?> findUnique({
    required _i3.SeasonWhereUniqueInput where,
    _i3.SeasonSelect? select,
    _i3.SeasonInclude? include,
  }) {
    final args = {
      'where': where,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Season',
      action: _i1.JsonQueryAction.findUnique,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Season?>(
      action: 'findUniqueSeason',
      result: result,
      factory: (e) => e != null ? _i2.Season.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.Season> findUniqueOrThrow({
    required _i3.SeasonWhereUniqueInput where,
    _i3.SeasonSelect? select,
    _i3.SeasonInclude? include,
  }) {
    final args = {
      'where': where,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Season',
      action: _i1.JsonQueryAction.findUniqueOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Season>(
      action: 'findUniqueSeasonOrThrow',
      result: result,
      factory: (e) => _i2.Season.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Season?> findFirst({
    _i3.SeasonWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.SeasonOrderByWithRelationInput>,
            _i3.SeasonOrderByWithRelationInput>?
        orderBy,
    _i3.SeasonWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.SeasonScalar, Iterable<_i3.SeasonScalar>>? distinct,
    _i3.SeasonSelect? select,
    _i3.SeasonInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Season',
      action: _i1.JsonQueryAction.findFirst,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Season?>(
      action: 'findFirstSeason',
      result: result,
      factory: (e) => e != null ? _i2.Season.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.Season> findFirstOrThrow({
    _i3.SeasonWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.SeasonOrderByWithRelationInput>,
            _i3.SeasonOrderByWithRelationInput>?
        orderBy,
    _i3.SeasonWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.SeasonScalar, Iterable<_i3.SeasonScalar>>? distinct,
    _i3.SeasonSelect? select,
    _i3.SeasonInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Season',
      action: _i1.JsonQueryAction.findFirstOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Season>(
      action: 'findFirstSeasonOrThrow',
      result: result,
      factory: (e) => _i2.Season.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.Season>> findMany({
    _i3.SeasonWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.SeasonOrderByWithRelationInput>,
            _i3.SeasonOrderByWithRelationInput>?
        orderBy,
    _i3.SeasonWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.SeasonScalar, Iterable<_i3.SeasonScalar>>? distinct,
    _i3.SeasonSelect? select,
    _i3.SeasonInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Season',
      action: _i1.JsonQueryAction.findMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.Season>>(
      action: 'findManySeason',
      result: result,
      factory: (values) =>
          (values as Iterable).map((e) => _i2.Season.fromJson(e)),
    );
  }

  _i1.ActionClient<_i2.Season> create({
    required _i1
        .PrismaUnion<_i3.SeasonCreateInput, _i3.SeasonUncheckedCreateInput>
        data,
    _i3.SeasonSelect? select,
    _i3.SeasonInclude? include,
  }) {
    final args = {
      'data': data,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Season',
      action: _i1.JsonQueryAction.createOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Season>(
      action: 'createOneSeason',
      result: result,
      factory: (e) => _i2.Season.fromJson(e),
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> createMany(
      {required _i1.PrismaUnion<_i3.SeasonCreateManyInput,
              Iterable<_i3.SeasonCreateManyInput>>
          data}) {
    final args = {'data': data};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Season',
      action: _i1.JsonQueryAction.createMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'createManySeason',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.CreateManySeasonAndReturnOutputType>>
      createManyAndReturn({
    required _i1.PrismaUnion<_i3.SeasonCreateManyInput,
            Iterable<_i3.SeasonCreateManyInput>>
        data,
    _i3.CreateManySeasonAndReturnOutputTypeSelect? select,
  }) {
    final args = {
      'data': data,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Season',
      action: _i1.JsonQueryAction.createManyAndReturn,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.CreateManySeasonAndReturnOutputType>>(
      action: 'createManySeasonAndReturn',
      result: result,
      factory: (values) => (values as Iterable)
          .map((e) => _i2.CreateManySeasonAndReturnOutputType.fromJson(e)),
    );
  }

  _i1.ActionClient<_i2.Season?> update({
    required _i1
        .PrismaUnion<_i3.SeasonUpdateInput, _i3.SeasonUncheckedUpdateInput>
        data,
    required _i3.SeasonWhereUniqueInput where,
    _i3.SeasonSelect? select,
    _i3.SeasonInclude? include,
  }) {
    final args = {
      'data': data,
      'where': where,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Season',
      action: _i1.JsonQueryAction.updateOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Season?>(
      action: 'updateOneSeason',
      result: result,
      factory: (e) => e != null ? _i2.Season.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> updateMany({
    required _i1.PrismaUnion<_i3.SeasonUpdateManyMutationInput,
            _i3.SeasonUncheckedUpdateManyInput>
        data,
    _i3.SeasonWhereInput? where,
  }) {
    final args = {
      'data': data,
      'where': where,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Season',
      action: _i1.JsonQueryAction.updateMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'updateManySeason',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Season> upsert({
    required _i3.SeasonWhereUniqueInput where,
    required _i1
        .PrismaUnion<_i3.SeasonCreateInput, _i3.SeasonUncheckedCreateInput>
        create,
    required _i1
        .PrismaUnion<_i3.SeasonUpdateInput, _i3.SeasonUncheckedUpdateInput>
        update,
    _i3.SeasonSelect? select,
    _i3.SeasonInclude? include,
  }) {
    final args = {
      'where': where,
      'create': create,
      'update': update,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Season',
      action: _i1.JsonQueryAction.upsertOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Season>(
      action: 'upsertOneSeason',
      result: result,
      factory: (e) => _i2.Season.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Season?> delete({
    required _i3.SeasonWhereUniqueInput where,
    _i3.SeasonSelect? select,
    _i3.SeasonInclude? include,
  }) {
    final args = {
      'where': where,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Season',
      action: _i1.JsonQueryAction.deleteOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Season?>(
      action: 'deleteOneSeason',
      result: result,
      factory: (e) => e != null ? _i2.Season.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> deleteMany(
      {_i3.SeasonWhereInput? where}) {
    final args = {'where': where};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Season',
      action: _i1.JsonQueryAction.deleteMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'deleteManySeason',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i3.SeasonGroupByOutputType>> groupBy({
    _i3.SeasonWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.SeasonOrderByWithAggregationInput>,
            _i3.SeasonOrderByWithAggregationInput>?
        orderBy,
    required _i1.PrismaUnion<Iterable<_i3.SeasonScalar>, _i3.SeasonScalar> by,
    _i3.SeasonScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
    _i3.SeasonGroupByOutputTypeSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'by': _i1.JsonQuery.groupBySerializer(by),
      'having': having,
      'take': take,
      'skip': skip,
      'select': select ?? _i1.JsonQuery.groupBySelectSerializer(by),
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Season',
      action: _i1.JsonQueryAction.groupBy,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i3.SeasonGroupByOutputType>>(
      action: 'groupBySeason',
      result: result,
      factory: (values) => (values as Iterable)
          .map((e) => _i3.SeasonGroupByOutputType.fromJson(e)),
    );
  }

  _i1.ActionClient<_i3.AggregateSeason> aggregate({
    _i3.SeasonWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.SeasonOrderByWithRelationInput>,
            _i3.SeasonOrderByWithRelationInput>?
        orderBy,
    _i3.SeasonWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i3.AggregateSeasonSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Season',
      action: _i1.JsonQueryAction.aggregate,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AggregateSeason>(
      action: 'aggregateSeason',
      result: result,
      factory: (e) => _i3.AggregateSeason.fromJson(e),
    );
  }
}

class GameDelegate {
  const GameDelegate._(this._client);

  final PrismaClient _client;

  _i1.ActionClient<_i2.Game?> findUnique({
    required _i3.GameWhereUniqueInput where,
    _i3.GameSelect? select,
    _i3.GameInclude? include,
  }) {
    final args = {
      'where': where,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Game',
      action: _i1.JsonQueryAction.findUnique,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Game?>(
      action: 'findUniqueGame',
      result: result,
      factory: (e) => e != null ? _i2.Game.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.Game> findUniqueOrThrow({
    required _i3.GameWhereUniqueInput where,
    _i3.GameSelect? select,
    _i3.GameInclude? include,
  }) {
    final args = {
      'where': where,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Game',
      action: _i1.JsonQueryAction.findUniqueOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Game>(
      action: 'findUniqueGameOrThrow',
      result: result,
      factory: (e) => _i2.Game.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Game?> findFirst({
    _i3.GameWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.GameOrderByWithRelationInput>,
            _i3.GameOrderByWithRelationInput>?
        orderBy,
    _i3.GameWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.GameScalar, Iterable<_i3.GameScalar>>? distinct,
    _i3.GameSelect? select,
    _i3.GameInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Game',
      action: _i1.JsonQueryAction.findFirst,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Game?>(
      action: 'findFirstGame',
      result: result,
      factory: (e) => e != null ? _i2.Game.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.Game> findFirstOrThrow({
    _i3.GameWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.GameOrderByWithRelationInput>,
            _i3.GameOrderByWithRelationInput>?
        orderBy,
    _i3.GameWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.GameScalar, Iterable<_i3.GameScalar>>? distinct,
    _i3.GameSelect? select,
    _i3.GameInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Game',
      action: _i1.JsonQueryAction.findFirstOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Game>(
      action: 'findFirstGameOrThrow',
      result: result,
      factory: (e) => _i2.Game.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.Game>> findMany({
    _i3.GameWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.GameOrderByWithRelationInput>,
            _i3.GameOrderByWithRelationInput>?
        orderBy,
    _i3.GameWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.GameScalar, Iterable<_i3.GameScalar>>? distinct,
    _i3.GameSelect? select,
    _i3.GameInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Game',
      action: _i1.JsonQueryAction.findMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.Game>>(
      action: 'findManyGame',
      result: result,
      factory: (values) =>
          (values as Iterable).map((e) => _i2.Game.fromJson(e)),
    );
  }

  _i1.ActionClient<_i2.Game> create({
    required _i1.PrismaUnion<_i3.GameCreateInput, _i3.GameUncheckedCreateInput>
        data,
    _i3.GameSelect? select,
    _i3.GameInclude? include,
  }) {
    final args = {
      'data': data,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Game',
      action: _i1.JsonQueryAction.createOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Game>(
      action: 'createOneGame',
      result: result,
      factory: (e) => _i2.Game.fromJson(e),
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> createMany(
      {required _i1.PrismaUnion<_i3.GameCreateManyInput,
              Iterable<_i3.GameCreateManyInput>>
          data}) {
    final args = {'data': data};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Game',
      action: _i1.JsonQueryAction.createMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'createManyGame',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.CreateManyGameAndReturnOutputType>>
      createManyAndReturn({
    required _i1
        .PrismaUnion<_i3.GameCreateManyInput, Iterable<_i3.GameCreateManyInput>>
        data,
    _i3.CreateManyGameAndReturnOutputTypeSelect? select,
    _i3.CreateManyGameAndReturnOutputTypeInclude? include,
  }) {
    final args = {
      'data': data,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Game',
      action: _i1.JsonQueryAction.createManyAndReturn,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.CreateManyGameAndReturnOutputType>>(
      action: 'createManyGameAndReturn',
      result: result,
      factory: (values) => (values as Iterable)
          .map((e) => _i2.CreateManyGameAndReturnOutputType.fromJson(e)),
    );
  }

  _i1.ActionClient<_i2.Game?> update({
    required _i1.PrismaUnion<_i3.GameUpdateInput, _i3.GameUncheckedUpdateInput>
        data,
    required _i3.GameWhereUniqueInput where,
    _i3.GameSelect? select,
    _i3.GameInclude? include,
  }) {
    final args = {
      'data': data,
      'where': where,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Game',
      action: _i1.JsonQueryAction.updateOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Game?>(
      action: 'updateOneGame',
      result: result,
      factory: (e) => e != null ? _i2.Game.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> updateMany({
    required _i1.PrismaUnion<_i3.GameUpdateManyMutationInput,
            _i3.GameUncheckedUpdateManyInput>
        data,
    _i3.GameWhereInput? where,
  }) {
    final args = {
      'data': data,
      'where': where,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Game',
      action: _i1.JsonQueryAction.updateMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'updateManyGame',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Game> upsert({
    required _i3.GameWhereUniqueInput where,
    required _i1.PrismaUnion<_i3.GameCreateInput, _i3.GameUncheckedCreateInput>
        create,
    required _i1.PrismaUnion<_i3.GameUpdateInput, _i3.GameUncheckedUpdateInput>
        update,
    _i3.GameSelect? select,
    _i3.GameInclude? include,
  }) {
    final args = {
      'where': where,
      'create': create,
      'update': update,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Game',
      action: _i1.JsonQueryAction.upsertOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Game>(
      action: 'upsertOneGame',
      result: result,
      factory: (e) => _i2.Game.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Game?> delete({
    required _i3.GameWhereUniqueInput where,
    _i3.GameSelect? select,
    _i3.GameInclude? include,
  }) {
    final args = {
      'where': where,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Game',
      action: _i1.JsonQueryAction.deleteOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Game?>(
      action: 'deleteOneGame',
      result: result,
      factory: (e) => e != null ? _i2.Game.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> deleteMany(
      {_i3.GameWhereInput? where}) {
    final args = {'where': where};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Game',
      action: _i1.JsonQueryAction.deleteMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'deleteManyGame',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i3.GameGroupByOutputType>> groupBy({
    _i3.GameWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.GameOrderByWithAggregationInput>,
            _i3.GameOrderByWithAggregationInput>?
        orderBy,
    required _i1.PrismaUnion<Iterable<_i3.GameScalar>, _i3.GameScalar> by,
    _i3.GameScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
    _i3.GameGroupByOutputTypeSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'by': _i1.JsonQuery.groupBySerializer(by),
      'having': having,
      'take': take,
      'skip': skip,
      'select': select ?? _i1.JsonQuery.groupBySelectSerializer(by),
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Game',
      action: _i1.JsonQueryAction.groupBy,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i3.GameGroupByOutputType>>(
      action: 'groupByGame',
      result: result,
      factory: (values) => (values as Iterable)
          .map((e) => _i3.GameGroupByOutputType.fromJson(e)),
    );
  }

  _i1.ActionClient<_i3.AggregateGame> aggregate({
    _i3.GameWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.GameOrderByWithRelationInput>,
            _i3.GameOrderByWithRelationInput>?
        orderBy,
    _i3.GameWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i3.AggregateGameSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Game',
      action: _i1.JsonQueryAction.aggregate,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AggregateGame>(
      action: 'aggregateGame',
      result: result,
      factory: (e) => _i3.AggregateGame.fromJson(e),
    );
  }
}

class QuarterDelegate {
  const QuarterDelegate._(this._client);

  final PrismaClient _client;

  _i1.ActionClient<_i2.Quarter?> findUnique({
    required _i3.QuarterWhereUniqueInput where,
    _i3.QuarterSelect? select,
  }) {
    final args = {
      'where': where,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Quarter',
      action: _i1.JsonQueryAction.findUnique,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Quarter?>(
      action: 'findUniqueQuarter',
      result: result,
      factory: (e) => e != null ? _i2.Quarter.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.Quarter> findUniqueOrThrow({
    required _i3.QuarterWhereUniqueInput where,
    _i3.QuarterSelect? select,
  }) {
    final args = {
      'where': where,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Quarter',
      action: _i1.JsonQueryAction.findUniqueOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Quarter>(
      action: 'findUniqueQuarterOrThrow',
      result: result,
      factory: (e) => _i2.Quarter.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Quarter?> findFirst({
    _i3.QuarterWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.QuarterOrderByWithRelationInput>,
            _i3.QuarterOrderByWithRelationInput>?
        orderBy,
    _i3.QuarterWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.QuarterScalar, Iterable<_i3.QuarterScalar>>? distinct,
    _i3.QuarterSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Quarter',
      action: _i1.JsonQueryAction.findFirst,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Quarter?>(
      action: 'findFirstQuarter',
      result: result,
      factory: (e) => e != null ? _i2.Quarter.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.Quarter> findFirstOrThrow({
    _i3.QuarterWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.QuarterOrderByWithRelationInput>,
            _i3.QuarterOrderByWithRelationInput>?
        orderBy,
    _i3.QuarterWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.QuarterScalar, Iterable<_i3.QuarterScalar>>? distinct,
    _i3.QuarterSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Quarter',
      action: _i1.JsonQueryAction.findFirstOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Quarter>(
      action: 'findFirstQuarterOrThrow',
      result: result,
      factory: (e) => _i2.Quarter.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.Quarter>> findMany({
    _i3.QuarterWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.QuarterOrderByWithRelationInput>,
            _i3.QuarterOrderByWithRelationInput>?
        orderBy,
    _i3.QuarterWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.QuarterScalar, Iterable<_i3.QuarterScalar>>? distinct,
    _i3.QuarterSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Quarter',
      action: _i1.JsonQueryAction.findMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.Quarter>>(
      action: 'findManyQuarter',
      result: result,
      factory: (values) =>
          (values as Iterable).map((e) => _i2.Quarter.fromJson(e)),
    );
  }

  _i1.ActionClient<_i2.Quarter> create({
    required _i1
        .PrismaUnion<_i3.QuarterCreateInput, _i3.QuarterUncheckedCreateInput>
        data,
    _i3.QuarterSelect? select,
  }) {
    final args = {
      'data': data,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Quarter',
      action: _i1.JsonQueryAction.createOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Quarter>(
      action: 'createOneQuarter',
      result: result,
      factory: (e) => _i2.Quarter.fromJson(e),
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> createMany(
      {required _i1.PrismaUnion<_i3.QuarterCreateManyInput,
              Iterable<_i3.QuarterCreateManyInput>>
          data}) {
    final args = {'data': data};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Quarter',
      action: _i1.JsonQueryAction.createMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'createManyQuarter',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.CreateManyQuarterAndReturnOutputType>>
      createManyAndReturn({
    required _i1.PrismaUnion<_i3.QuarterCreateManyInput,
            Iterable<_i3.QuarterCreateManyInput>>
        data,
    _i3.CreateManyQuarterAndReturnOutputTypeSelect? select,
  }) {
    final args = {
      'data': data,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Quarter',
      action: _i1.JsonQueryAction.createManyAndReturn,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.CreateManyQuarterAndReturnOutputType>>(
      action: 'createManyQuarterAndReturn',
      result: result,
      factory: (values) => (values as Iterable)
          .map((e) => _i2.CreateManyQuarterAndReturnOutputType.fromJson(e)),
    );
  }

  _i1.ActionClient<_i2.Quarter?> update({
    required _i1
        .PrismaUnion<_i3.QuarterUpdateInput, _i3.QuarterUncheckedUpdateInput>
        data,
    required _i3.QuarterWhereUniqueInput where,
    _i3.QuarterSelect? select,
  }) {
    final args = {
      'data': data,
      'where': where,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Quarter',
      action: _i1.JsonQueryAction.updateOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Quarter?>(
      action: 'updateOneQuarter',
      result: result,
      factory: (e) => e != null ? _i2.Quarter.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> updateMany({
    required _i1.PrismaUnion<_i3.QuarterUpdateManyMutationInput,
            _i3.QuarterUncheckedUpdateManyInput>
        data,
    _i3.QuarterWhereInput? where,
  }) {
    final args = {
      'data': data,
      'where': where,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Quarter',
      action: _i1.JsonQueryAction.updateMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'updateManyQuarter',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Quarter> upsert({
    required _i3.QuarterWhereUniqueInput where,
    required _i1
        .PrismaUnion<_i3.QuarterCreateInput, _i3.QuarterUncheckedCreateInput>
        create,
    required _i1
        .PrismaUnion<_i3.QuarterUpdateInput, _i3.QuarterUncheckedUpdateInput>
        update,
    _i3.QuarterSelect? select,
  }) {
    final args = {
      'where': where,
      'create': create,
      'update': update,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Quarter',
      action: _i1.JsonQueryAction.upsertOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Quarter>(
      action: 'upsertOneQuarter',
      result: result,
      factory: (e) => _i2.Quarter.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Quarter?> delete({
    required _i3.QuarterWhereUniqueInput where,
    _i3.QuarterSelect? select,
  }) {
    final args = {
      'where': where,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Quarter',
      action: _i1.JsonQueryAction.deleteOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Quarter?>(
      action: 'deleteOneQuarter',
      result: result,
      factory: (e) => e != null ? _i2.Quarter.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> deleteMany(
      {_i3.QuarterWhereInput? where}) {
    final args = {'where': where};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Quarter',
      action: _i1.JsonQueryAction.deleteMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'deleteManyQuarter',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i3.QuarterGroupByOutputType>> groupBy({
    _i3.QuarterWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.QuarterOrderByWithAggregationInput>,
            _i3.QuarterOrderByWithAggregationInput>?
        orderBy,
    required _i1.PrismaUnion<Iterable<_i3.QuarterScalar>, _i3.QuarterScalar> by,
    _i3.QuarterScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
    _i3.QuarterGroupByOutputTypeSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'by': _i1.JsonQuery.groupBySerializer(by),
      'having': having,
      'take': take,
      'skip': skip,
      'select': select ?? _i1.JsonQuery.groupBySelectSerializer(by),
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Quarter',
      action: _i1.JsonQueryAction.groupBy,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i3.QuarterGroupByOutputType>>(
      action: 'groupByQuarter',
      result: result,
      factory: (values) => (values as Iterable)
          .map((e) => _i3.QuarterGroupByOutputType.fromJson(e)),
    );
  }

  _i1.ActionClient<_i3.AggregateQuarter> aggregate({
    _i3.QuarterWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.QuarterOrderByWithRelationInput>,
            _i3.QuarterOrderByWithRelationInput>?
        orderBy,
    _i3.QuarterWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i3.AggregateQuarterSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Quarter',
      action: _i1.JsonQueryAction.aggregate,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AggregateQuarter>(
      action: 'aggregateQuarter',
      result: result,
      factory: (e) => _i3.AggregateQuarter.fromJson(e),
    );
  }
}

class TeamDelegate {
  const TeamDelegate._(this._client);

  final PrismaClient _client;

  _i1.ActionClient<_i2.Team?> findUnique({
    required _i3.TeamWhereUniqueInput where,
    _i3.TeamSelect? select,
    _i3.TeamInclude? include,
  }) {
    final args = {
      'where': where,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Team',
      action: _i1.JsonQueryAction.findUnique,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Team?>(
      action: 'findUniqueTeam',
      result: result,
      factory: (e) => e != null ? _i2.Team.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.Team> findUniqueOrThrow({
    required _i3.TeamWhereUniqueInput where,
    _i3.TeamSelect? select,
    _i3.TeamInclude? include,
  }) {
    final args = {
      'where': where,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Team',
      action: _i1.JsonQueryAction.findUniqueOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Team>(
      action: 'findUniqueTeamOrThrow',
      result: result,
      factory: (e) => _i2.Team.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Team?> findFirst({
    _i3.TeamWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.TeamOrderByWithRelationInput>,
            _i3.TeamOrderByWithRelationInput>?
        orderBy,
    _i3.TeamWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.TeamScalar, Iterable<_i3.TeamScalar>>? distinct,
    _i3.TeamSelect? select,
    _i3.TeamInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Team',
      action: _i1.JsonQueryAction.findFirst,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Team?>(
      action: 'findFirstTeam',
      result: result,
      factory: (e) => e != null ? _i2.Team.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.Team> findFirstOrThrow({
    _i3.TeamWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.TeamOrderByWithRelationInput>,
            _i3.TeamOrderByWithRelationInput>?
        orderBy,
    _i3.TeamWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.TeamScalar, Iterable<_i3.TeamScalar>>? distinct,
    _i3.TeamSelect? select,
    _i3.TeamInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Team',
      action: _i1.JsonQueryAction.findFirstOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Team>(
      action: 'findFirstTeamOrThrow',
      result: result,
      factory: (e) => _i2.Team.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.Team>> findMany({
    _i3.TeamWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.TeamOrderByWithRelationInput>,
            _i3.TeamOrderByWithRelationInput>?
        orderBy,
    _i3.TeamWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.TeamScalar, Iterable<_i3.TeamScalar>>? distinct,
    _i3.TeamSelect? select,
    _i3.TeamInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Team',
      action: _i1.JsonQueryAction.findMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.Team>>(
      action: 'findManyTeam',
      result: result,
      factory: (values) =>
          (values as Iterable).map((e) => _i2.Team.fromJson(e)),
    );
  }

  _i1.ActionClient<_i2.Team> create({
    required _i1.PrismaUnion<_i3.TeamCreateInput, _i3.TeamUncheckedCreateInput>
        data,
    _i3.TeamSelect? select,
    _i3.TeamInclude? include,
  }) {
    final args = {
      'data': data,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Team',
      action: _i1.JsonQueryAction.createOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Team>(
      action: 'createOneTeam',
      result: result,
      factory: (e) => _i2.Team.fromJson(e),
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> createMany(
      {required _i1.PrismaUnion<_i3.TeamCreateManyInput,
              Iterable<_i3.TeamCreateManyInput>>
          data}) {
    final args = {'data': data};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Team',
      action: _i1.JsonQueryAction.createMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'createManyTeam',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.CreateManyTeamAndReturnOutputType>>
      createManyAndReturn({
    required _i1
        .PrismaUnion<_i3.TeamCreateManyInput, Iterable<_i3.TeamCreateManyInput>>
        data,
    _i3.CreateManyTeamAndReturnOutputTypeSelect? select,
  }) {
    final args = {
      'data': data,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Team',
      action: _i1.JsonQueryAction.createManyAndReturn,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.CreateManyTeamAndReturnOutputType>>(
      action: 'createManyTeamAndReturn',
      result: result,
      factory: (values) => (values as Iterable)
          .map((e) => _i2.CreateManyTeamAndReturnOutputType.fromJson(e)),
    );
  }

  _i1.ActionClient<_i2.Team?> update({
    required _i1.PrismaUnion<_i3.TeamUpdateInput, _i3.TeamUncheckedUpdateInput>
        data,
    required _i3.TeamWhereUniqueInput where,
    _i3.TeamSelect? select,
    _i3.TeamInclude? include,
  }) {
    final args = {
      'data': data,
      'where': where,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Team',
      action: _i1.JsonQueryAction.updateOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Team?>(
      action: 'updateOneTeam',
      result: result,
      factory: (e) => e != null ? _i2.Team.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> updateMany({
    required _i1.PrismaUnion<_i3.TeamUpdateManyMutationInput,
            _i3.TeamUncheckedUpdateManyInput>
        data,
    _i3.TeamWhereInput? where,
  }) {
    final args = {
      'data': data,
      'where': where,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Team',
      action: _i1.JsonQueryAction.updateMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'updateManyTeam',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Team> upsert({
    required _i3.TeamWhereUniqueInput where,
    required _i1.PrismaUnion<_i3.TeamCreateInput, _i3.TeamUncheckedCreateInput>
        create,
    required _i1.PrismaUnion<_i3.TeamUpdateInput, _i3.TeamUncheckedUpdateInput>
        update,
    _i3.TeamSelect? select,
    _i3.TeamInclude? include,
  }) {
    final args = {
      'where': where,
      'create': create,
      'update': update,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Team',
      action: _i1.JsonQueryAction.upsertOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Team>(
      action: 'upsertOneTeam',
      result: result,
      factory: (e) => _i2.Team.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Team?> delete({
    required _i3.TeamWhereUniqueInput where,
    _i3.TeamSelect? select,
    _i3.TeamInclude? include,
  }) {
    final args = {
      'where': where,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Team',
      action: _i1.JsonQueryAction.deleteOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Team?>(
      action: 'deleteOneTeam',
      result: result,
      factory: (e) => e != null ? _i2.Team.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> deleteMany(
      {_i3.TeamWhereInput? where}) {
    final args = {'where': where};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Team',
      action: _i1.JsonQueryAction.deleteMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'deleteManyTeam',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i3.TeamGroupByOutputType>> groupBy({
    _i3.TeamWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.TeamOrderByWithAggregationInput>,
            _i3.TeamOrderByWithAggregationInput>?
        orderBy,
    required _i1.PrismaUnion<Iterable<_i3.TeamScalar>, _i3.TeamScalar> by,
    _i3.TeamScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
    _i3.TeamGroupByOutputTypeSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'by': _i1.JsonQuery.groupBySerializer(by),
      'having': having,
      'take': take,
      'skip': skip,
      'select': select ?? _i1.JsonQuery.groupBySelectSerializer(by),
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Team',
      action: _i1.JsonQueryAction.groupBy,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i3.TeamGroupByOutputType>>(
      action: 'groupByTeam',
      result: result,
      factory: (values) => (values as Iterable)
          .map((e) => _i3.TeamGroupByOutputType.fromJson(e)),
    );
  }

  _i1.ActionClient<_i3.AggregateTeam> aggregate({
    _i3.TeamWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.TeamOrderByWithRelationInput>,
            _i3.TeamOrderByWithRelationInput>?
        orderBy,
    _i3.TeamWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i3.AggregateTeamSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Team',
      action: _i1.JsonQueryAction.aggregate,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AggregateTeam>(
      action: 'aggregateTeam',
      result: result,
      factory: (e) => _i3.AggregateTeam.fromJson(e),
    );
  }
}

class PlayerDelegate {
  const PlayerDelegate._(this._client);

  final PrismaClient _client;

  _i1.ActionClient<_i2.Player?> findUnique({
    required _i3.PlayerWhereUniqueInput where,
    _i3.PlayerSelect? select,
    _i3.PlayerInclude? include,
  }) {
    final args = {
      'where': where,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Player',
      action: _i1.JsonQueryAction.findUnique,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Player?>(
      action: 'findUniquePlayer',
      result: result,
      factory: (e) => e != null ? _i2.Player.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.Player> findUniqueOrThrow({
    required _i3.PlayerWhereUniqueInput where,
    _i3.PlayerSelect? select,
    _i3.PlayerInclude? include,
  }) {
    final args = {
      'where': where,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Player',
      action: _i1.JsonQueryAction.findUniqueOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Player>(
      action: 'findUniquePlayerOrThrow',
      result: result,
      factory: (e) => _i2.Player.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Player?> findFirst({
    _i3.PlayerWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.PlayerOrderByWithRelationInput>,
            _i3.PlayerOrderByWithRelationInput>?
        orderBy,
    _i3.PlayerWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.PlayerScalar, Iterable<_i3.PlayerScalar>>? distinct,
    _i3.PlayerSelect? select,
    _i3.PlayerInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Player',
      action: _i1.JsonQueryAction.findFirst,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Player?>(
      action: 'findFirstPlayer',
      result: result,
      factory: (e) => e != null ? _i2.Player.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i2.Player> findFirstOrThrow({
    _i3.PlayerWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.PlayerOrderByWithRelationInput>,
            _i3.PlayerOrderByWithRelationInput>?
        orderBy,
    _i3.PlayerWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.PlayerScalar, Iterable<_i3.PlayerScalar>>? distinct,
    _i3.PlayerSelect? select,
    _i3.PlayerInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Player',
      action: _i1.JsonQueryAction.findFirstOrThrow,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Player>(
      action: 'findFirstPlayerOrThrow',
      result: result,
      factory: (e) => _i2.Player.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.Player>> findMany({
    _i3.PlayerWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.PlayerOrderByWithRelationInput>,
            _i3.PlayerOrderByWithRelationInput>?
        orderBy,
    _i3.PlayerWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i1.PrismaUnion<_i3.PlayerScalar, Iterable<_i3.PlayerScalar>>? distinct,
    _i3.PlayerSelect? select,
    _i3.PlayerInclude? include,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'distinct': distinct,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Player',
      action: _i1.JsonQueryAction.findMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.Player>>(
      action: 'findManyPlayer',
      result: result,
      factory: (values) =>
          (values as Iterable).map((e) => _i2.Player.fromJson(e)),
    );
  }

  _i1.ActionClient<_i2.Player> create({
    required _i1
        .PrismaUnion<_i3.PlayerCreateInput, _i3.PlayerUncheckedCreateInput>
        data,
    _i3.PlayerSelect? select,
    _i3.PlayerInclude? include,
  }) {
    final args = {
      'data': data,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Player',
      action: _i1.JsonQueryAction.createOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Player>(
      action: 'createOnePlayer',
      result: result,
      factory: (e) => _i2.Player.fromJson(e),
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> createMany(
      {required _i1.PrismaUnion<_i3.PlayerCreateManyInput,
              Iterable<_i3.PlayerCreateManyInput>>
          data}) {
    final args = {'data': data};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Player',
      action: _i1.JsonQueryAction.createMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'createManyPlayer',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i2.CreateManyPlayerAndReturnOutputType>>
      createManyAndReturn({
    required _i1.PrismaUnion<_i3.PlayerCreateManyInput,
            Iterable<_i3.PlayerCreateManyInput>>
        data,
    _i3.CreateManyPlayerAndReturnOutputTypeSelect? select,
    _i3.CreateManyPlayerAndReturnOutputTypeInclude? include,
  }) {
    final args = {
      'data': data,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Player',
      action: _i1.JsonQueryAction.createManyAndReturn,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i2.CreateManyPlayerAndReturnOutputType>>(
      action: 'createManyPlayerAndReturn',
      result: result,
      factory: (values) => (values as Iterable)
          .map((e) => _i2.CreateManyPlayerAndReturnOutputType.fromJson(e)),
    );
  }

  _i1.ActionClient<_i2.Player?> update({
    required _i1
        .PrismaUnion<_i3.PlayerUpdateInput, _i3.PlayerUncheckedUpdateInput>
        data,
    required _i3.PlayerWhereUniqueInput where,
    _i3.PlayerSelect? select,
    _i3.PlayerInclude? include,
  }) {
    final args = {
      'data': data,
      'where': where,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Player',
      action: _i1.JsonQueryAction.updateOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Player?>(
      action: 'updateOnePlayer',
      result: result,
      factory: (e) => e != null ? _i2.Player.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> updateMany({
    required _i1.PrismaUnion<_i3.PlayerUpdateManyMutationInput,
            _i3.PlayerUncheckedUpdateManyInput>
        data,
    _i3.PlayerWhereInput? where,
  }) {
    final args = {
      'data': data,
      'where': where,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Player',
      action: _i1.JsonQueryAction.updateMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'updateManyPlayer',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Player> upsert({
    required _i3.PlayerWhereUniqueInput where,
    required _i1
        .PrismaUnion<_i3.PlayerCreateInput, _i3.PlayerUncheckedCreateInput>
        create,
    required _i1
        .PrismaUnion<_i3.PlayerUpdateInput, _i3.PlayerUncheckedUpdateInput>
        update,
    _i3.PlayerSelect? select,
    _i3.PlayerInclude? include,
  }) {
    final args = {
      'where': where,
      'create': create,
      'update': update,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Player',
      action: _i1.JsonQueryAction.upsertOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Player>(
      action: 'upsertOnePlayer',
      result: result,
      factory: (e) => _i2.Player.fromJson(e),
    );
  }

  _i1.ActionClient<_i2.Player?> delete({
    required _i3.PlayerWhereUniqueInput where,
    _i3.PlayerSelect? select,
    _i3.PlayerInclude? include,
  }) {
    final args = {
      'where': where,
      'select': select,
      'include': include,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Player',
      action: _i1.JsonQueryAction.deleteOne,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i2.Player?>(
      action: 'deleteOnePlayer',
      result: result,
      factory: (e) => e != null ? _i2.Player.fromJson(e) : null,
    );
  }

  _i1.ActionClient<_i3.AffectedRowsOutput> deleteMany(
      {_i3.PlayerWhereInput? where}) {
    final args = {'where': where};
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Player',
      action: _i1.JsonQueryAction.deleteMany,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AffectedRowsOutput>(
      action: 'deleteManyPlayer',
      result: result,
      factory: (e) => _i3.AffectedRowsOutput.fromJson(e),
    );
  }

  _i1.ActionClient<Iterable<_i3.PlayerGroupByOutputType>> groupBy({
    _i3.PlayerWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.PlayerOrderByWithAggregationInput>,
            _i3.PlayerOrderByWithAggregationInput>?
        orderBy,
    required _i1.PrismaUnion<Iterable<_i3.PlayerScalar>, _i3.PlayerScalar> by,
    _i3.PlayerScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
    _i3.PlayerGroupByOutputTypeSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'by': _i1.JsonQuery.groupBySerializer(by),
      'having': having,
      'take': take,
      'skip': skip,
      'select': select ?? _i1.JsonQuery.groupBySelectSerializer(by),
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Player',
      action: _i1.JsonQueryAction.groupBy,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<Iterable<_i3.PlayerGroupByOutputType>>(
      action: 'groupByPlayer',
      result: result,
      factory: (values) => (values as Iterable)
          .map((e) => _i3.PlayerGroupByOutputType.fromJson(e)),
    );
  }

  _i1.ActionClient<_i3.AggregatePlayer> aggregate({
    _i3.PlayerWhereInput? where,
    _i1.PrismaUnion<Iterable<_i3.PlayerOrderByWithRelationInput>,
            _i3.PlayerOrderByWithRelationInput>?
        orderBy,
    _i3.PlayerWhereUniqueInput? cursor,
    int? take,
    int? skip,
    _i3.AggregatePlayerSelect? select,
  }) {
    final args = {
      'where': where,
      'orderBy': orderBy,
      'cursor': cursor,
      'take': take,
      'skip': skip,
      'select': select,
    };
    final query = _i1.serializeJsonQuery(
      args: args,
      modelName: 'Player',
      action: _i1.JsonQueryAction.aggregate,
      datamodel: PrismaClient.datamodel,
    );
    final result = _client.$engine.request(
      query,
      headers: _client.$transaction.headers,
      transaction: _client.$transaction.transaction,
    );
    return _i1.ActionClient<_i3.AggregatePlayer>(
      action: 'aggregatePlayer',
      result: result,
      factory: (e) => _i3.AggregatePlayer.fromJson(e),
    );
  }
}

class PrismaClient extends _i1.BasePrismaClient<PrismaClient> {
  PrismaClient({
    super.datasourceUrl,
    super.datasources,
    super.errorFormat,
    super.log,
    _i1.Engine? engine,
  }) : _engine = engine;

  static final datamodel = _i4.DataModel.fromJson({
    'enums': [],
    'models': [
      {
        'name': 'Season',
        'dbName': null,
        'fields': [
          {
            'name': 'id',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': true,
            'isReadOnly': false,
            'hasDefaultValue': true,
            'type': 'Int',
            'default': {
              'name': 'autoincrement',
              'args': [],
            },
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'startYear',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Int',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'endYear',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Int',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'games',
            'kind': 'object',
            'isList': true,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Game',
            'relationName': 'GameToSeason',
            'relationFromFields': [],
            'relationToFields': [],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
        ],
        'primaryKey': null,
        'uniqueFields': [],
        'uniqueIndexes': [],
        'isGenerated': false,
      },
      {
        'name': 'Game',
        'dbName': null,
        'fields': [
          {
            'name': 'id',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': true,
            'isReadOnly': false,
            'hasDefaultValue': true,
            'type': 'Int',
            'default': {
              'name': 'autoincrement',
              'args': [],
            },
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'title',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'againstTeam',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'date',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'DateTime',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'semester',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'team',
            'kind': 'object',
            'isList': false,
            'isRequired': false,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Team',
            'relationName': 'GameToTeam',
            'relationFromFields': ['teamID'],
            'relationToFields': ['id'],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'teamID',
            'kind': 'scalar',
            'isList': false,
            'isRequired': false,
            'isUnique': false,
            'isId': false,
            'isReadOnly': true,
            'hasDefaultValue': false,
            'type': 'Int',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'season',
            'kind': 'object',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Season',
            'relationName': 'GameToSeason',
            'relationFromFields': ['seasonID'],
            'relationToFields': ['id'],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'seasonID',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': true,
            'hasDefaultValue': false,
            'type': 'Int',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
        ],
        'primaryKey': null,
        'uniqueFields': [],
        'uniqueIndexes': [],
        'isGenerated': false,
      },
      {
        'name': 'Quarter',
        'dbName': null,
        'fields': [
          {
            'name': 'id',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': true,
            'isReadOnly': false,
            'hasDefaultValue': true,
            'type': 'Int',
            'default': {
              'name': 'autoincrement',
              'args': [],
            },
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'number',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Int',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'totalScore',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Int',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'madeOne',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Int',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'madeTwo',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Int',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'madeThree',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Int',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'miss',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Int',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'reboundOffensive',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Int',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'reboundDefensive',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Int',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'foul',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Int',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'turnover',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Int',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'assist',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Int',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'block',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Int',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'steal',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Int',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
        ],
        'primaryKey': null,
        'uniqueFields': [],
        'uniqueIndexes': [],
        'isGenerated': false,
      },
      {
        'name': 'Team',
        'dbName': null,
        'fields': [
          {
            'name': 'id',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': true,
            'isReadOnly': false,
            'hasDefaultValue': true,
            'type': 'Int',
            'default': {
              'name': 'autoincrement',
              'args': [],
            },
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'name',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'Game',
            'kind': 'object',
            'isList': true,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Game',
            'relationName': 'GameToTeam',
            'relationFromFields': [],
            'relationToFields': [],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'Player',
            'kind': 'object',
            'isList': true,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Player',
            'relationName': 'PlayerToTeam',
            'relationFromFields': [],
            'relationToFields': [],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
        ],
        'primaryKey': null,
        'uniqueFields': [],
        'uniqueIndexes': [],
        'isGenerated': false,
      },
      {
        'name': 'Player',
        'dbName': null,
        'fields': [
          {
            'name': 'id',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': true,
            'isReadOnly': false,
            'hasDefaultValue': true,
            'type': 'Int',
            'default': {
              'name': 'autoincrement',
              'args': [],
            },
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'lastName',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'firstName',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'middleName',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'String',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'jerseyNumber',
            'kind': 'scalar',
            'isList': false,
            'isRequired': true,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Int',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'gamesPlayed',
            'kind': 'scalar',
            'isList': false,
            'isRequired': false,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Int',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'team',
            'kind': 'object',
            'isList': false,
            'isRequired': false,
            'isUnique': false,
            'isId': false,
            'isReadOnly': false,
            'hasDefaultValue': false,
            'type': 'Team',
            'relationName': 'PlayerToTeam',
            'relationFromFields': ['teamID'],
            'relationToFields': ['id'],
            'isGenerated': false,
            'isUpdatedAt': false,
          },
          {
            'name': 'teamID',
            'kind': 'scalar',
            'isList': false,
            'isRequired': false,
            'isUnique': false,
            'isId': false,
            'isReadOnly': true,
            'hasDefaultValue': false,
            'type': 'Int',
            'isGenerated': false,
            'isUpdatedAt': false,
          },
        ],
        'primaryKey': null,
        'uniqueFields': [],
        'uniqueIndexes': [],
        'isGenerated': false,
      },
    ],
    'types': [],
    'indexes': [
      {
        'model': 'Season',
        'type': 'id',
        'isDefinedOnField': true,
        'fields': [
          {'name': 'id'}
        ],
      },
      {
        'model': 'Game',
        'type': 'id',
        'isDefinedOnField': true,
        'fields': [
          {'name': 'id'}
        ],
      },
      {
        'model': 'Quarter',
        'type': 'id',
        'isDefinedOnField': true,
        'fields': [
          {'name': 'id'}
        ],
      },
      {
        'model': 'Team',
        'type': 'id',
        'isDefinedOnField': true,
        'fields': [
          {'name': 'id'}
        ],
      },
      {
        'model': 'Player',
        'type': 'id',
        'isDefinedOnField': true,
        'fields': [
          {'name': 'id'}
        ],
      },
    ],
  });

  _i1.Engine? _engine;

  _i1.TransactionClient<PrismaClient>? _transaction;

  @override
  get $transaction {
    if (_transaction != null) return _transaction!;
    PrismaClient factory(_i1.TransactionClient<PrismaClient> transaction) {
      final client = PrismaClient(
        engine: $engine,
        datasources: $options.datasources,
        datasourceUrl: $options.datasourceUrl,
        errorFormat: $options.errorFormat,
        log: $options.logEmitter.definition,
      );
      client.$options.logEmitter = $options.logEmitter;
      client._transaction = transaction;

      return client;
    }

    return _transaction = _i1.TransactionClient<PrismaClient>($engine, factory);
  }

  @override
  get $engine => _engine ??= _i5.LibraryEngine(
        schema:
            '// This is your Prisma schema file,\n// learn more about it in the docs: https://pris.ly/d/prisma-schema\n\n// Looking for ways to speed up your queries, or scale easily with your serverless or edge functions?\n// Try Prisma Accelerate: https://pris.ly/cli/accelerate-init\n\ngenerator client {\n  provider   = "dart run orm"\n  engineType = "flutter"\n}\n\ndatasource db {\n  provider  = "sqlite"\n  url       = env("DATABASE_URL")\n  // Why need directUrl ?\n  // The Prisma CLI tool uses the file URL relative to the prisma directory when it is configured at runtime. The Dart runtime uses PWD\n  directUrl = env("DIRECT_DATABASE_URL")\n}\n\nmodel Season {\n  id        Int    @id @default(autoincrement())\n  startYear Int\n  endYear   Int\n  games     Game[]\n}\n\nmodel Game {\n  id          Int      @id @default(autoincrement())\n  title       String\n  againstTeam String\n  date        DateTime\n  semester    String\n  team        Team?    @relation(fields: [teamID], references: [id])\n  teamID      Int?\n  season      Season   @relation(fields: [seasonID], references: [id]) // This defines the back reference from Game to Season\n  seasonID    Int\n}\n\nmodel Quarter {\n  id               Int @id @default(autoincrement())\n  number           Int\n  totalScore       Int\n  madeOne          Int\n  madeTwo          Int\n  madeThree        Int\n  miss             Int\n  reboundOffensive Int\n  reboundDefensive Int\n  foul             Int\n  turnover         Int\n  assist           Int\n  block            Int\n  steal            Int\n}\n\nmodel Team {\n  id     Int      @id @default(autoincrement())\n  name   String\n  Game   Game[]\n  Player Player[]\n}\n\nmodel Player {\n  id           Int    @id @default(autoincrement())\n  lastName     String\n  firstName    String\n  middleName   String\n  jerseyNumber Int\n  gamesPlayed  Int?\n  team         Team?  @relation(fields: [teamID], references: [id])\n  teamID       Int?\n}\n',
        datasources: const {
          'db': _i1.Datasource(
            _i1.DatasourceType.environment,
            'DATABASE_URL',
          )
        },
        options: $options,
      );

  @override
  get $datamodel => datamodel;

  SeasonDelegate get season => SeasonDelegate._(this);

  GameDelegate get game => GameDelegate._(this);

  QuarterDelegate get quarter => QuarterDelegate._(this);

  TeamDelegate get team => TeamDelegate._(this);

  PlayerDelegate get player => PlayerDelegate._(this);
}
