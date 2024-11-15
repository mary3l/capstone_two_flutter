// ignore_for_file: non_constant_identifier_names

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:orm/orm.dart' as _i1;

import 'prisma.dart' as _i2;

class NestedIntFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedIntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<int, _i1.Reference<int>>? equals;

  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lte;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gte;

  final _i1.PrismaUnion<int, _i2.NestedIntFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'not': not,
      };
}

class IntFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const IntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<int, _i1.Reference<int>>? equals;

  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lte;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gte;

  final _i1.PrismaUnion<int, _i2.NestedIntFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'not': not,
      };
}

class SeasonWhereInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.startYear,
    this.endYear,
  });

  final _i1.PrismaUnion<_i2.SeasonWhereInput, Iterable<_i2.SeasonWhereInput>>?
      AND;

  final Iterable<_i2.SeasonWhereInput>? OR;

  final _i1.PrismaUnion<_i2.SeasonWhereInput, Iterable<_i2.SeasonWhereInput>>?
      NOT;

  final _i1.PrismaUnion<_i2.IntFilter, int>? id;

  final _i1.PrismaUnion<_i2.IntFilter, int>? startYear;

  final _i1.PrismaUnion<_i2.IntFilter, int>? endYear;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
      };
}

class SeasonWhereUniqueInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonWhereUniqueInput({
    this.id,
    this.AND,
    this.OR,
    this.NOT,
    this.startYear,
    this.endYear,
  });

  final int? id;

  final _i1.PrismaUnion<_i2.SeasonWhereInput, Iterable<_i2.SeasonWhereInput>>?
      AND;

  final Iterable<_i2.SeasonWhereInput>? OR;

  final _i1.PrismaUnion<_i2.SeasonWhereInput, Iterable<_i2.SeasonWhereInput>>?
      NOT;

  final _i1.PrismaUnion<_i2.IntFilter, int>? startYear;

  final _i1.PrismaUnion<_i2.IntFilter, int>? endYear;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'startYear': startYear,
        'endYear': endYear,
      };
}

class SeasonSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonSelect({
    this.id,
    this.startYear,
    this.endYear,
  });

  final bool? id;

  final bool? startYear;

  final bool? endYear;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
      };
}

enum SortOrder implements _i1.PrismaEnum {
  asc._('asc'),
  desc._('desc');

  const SortOrder._(this.name);

  @override
  final String name;
}

class SeasonOrderByWithRelationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonOrderByWithRelationInput({
    this.id,
    this.startYear,
    this.endYear,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? startYear;

  final _i2.SortOrder? endYear;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
      };
}

enum SeasonScalar<T> implements _i1.PrismaEnum, _i1.Reference<T> {
  id<int>('id', 'Season'),
  startYear<int>('startYear', 'Season'),
  endYear<int>('endYear', 'Season');

  const SeasonScalar(
    this.name,
    this.model,
  );

  @override
  final String name;

  @override
  final String model;
}

class SeasonCreateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonCreateInput({
    required this.startYear,
    required this.endYear,
  });

  final int startYear;

  final int endYear;

  @override
  Map<String, dynamic> toJson() => {
        'startYear': startYear,
        'endYear': endYear,
      };
}

class SeasonUncheckedCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonUncheckedCreateInput({
    this.id,
    required this.startYear,
    required this.endYear,
  });

  final int? id;

  final int startYear;

  final int endYear;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
      };
}

class AffectedRowsOutput {
  const AffectedRowsOutput({this.count});

  factory AffectedRowsOutput.fromJson(Map json) =>
      AffectedRowsOutput(count: json['count']);

  final int? count;

  Map<String, dynamic> toJson() => {'count': count};
}

class SeasonCreateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonCreateManyInput({
    this.id,
    required this.startYear,
    required this.endYear,
  });

  final int? id;

  final int startYear;

  final int endYear;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
      };
}

class CreateManySeasonAndReturnOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const CreateManySeasonAndReturnOutputTypeSelect({
    this.id,
    this.startYear,
    this.endYear,
  });

  final bool? id;

  final bool? startYear;

  final bool? endYear;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
      };
}

class IntFieldUpdateOperationsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const IntFieldUpdateOperationsInput({
    this.set,
    this.increment,
    this.decrement,
    this.multiply,
    this.divide,
  });

  final int? set;

  final int? increment;

  final int? decrement;

  final int? multiply;

  final int? divide;

  @override
  Map<String, dynamic> toJson() => {
        'set': set,
        'increment': increment,
        'decrement': decrement,
        'multiply': multiply,
        'divide': divide,
      };
}

class SeasonUpdateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonUpdateInput({
    this.startYear,
    this.endYear,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? startYear;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? endYear;

  @override
  Map<String, dynamic> toJson() => {
        'startYear': startYear,
        'endYear': endYear,
      };
}

class SeasonUncheckedUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonUncheckedUpdateInput({
    this.id,
    this.startYear,
    this.endYear,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? startYear;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? endYear;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
      };
}

class SeasonUpdateManyMutationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonUpdateManyMutationInput({
    this.startYear,
    this.endYear,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? startYear;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? endYear;

  @override
  Map<String, dynamic> toJson() => {
        'startYear': startYear,
        'endYear': endYear,
      };
}

class SeasonUncheckedUpdateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonUncheckedUpdateManyInput({
    this.id,
    this.startYear,
    this.endYear,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? startYear;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? endYear;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
      };
}

class SeasonCountAggregateOutputType {
  const SeasonCountAggregateOutputType({
    this.id,
    this.startYear,
    this.endYear,
    this.$all,
  });

  factory SeasonCountAggregateOutputType.fromJson(Map json) =>
      SeasonCountAggregateOutputType(
        id: json['id'],
        startYear: json['startYear'],
        endYear: json['endYear'],
        $all: json['_all'],
      );

  final int? id;

  final int? startYear;

  final int? endYear;

  final int? $all;

  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
        '_all': $all,
      };
}

class SeasonAvgAggregateOutputType {
  const SeasonAvgAggregateOutputType({
    this.id,
    this.startYear,
    this.endYear,
  });

  factory SeasonAvgAggregateOutputType.fromJson(Map json) =>
      SeasonAvgAggregateOutputType(
        id: json['id'],
        startYear: json['startYear'],
        endYear: json['endYear'],
      );

  final double? id;

  final double? startYear;

  final double? endYear;

  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
      };
}

class SeasonSumAggregateOutputType {
  const SeasonSumAggregateOutputType({
    this.id,
    this.startYear,
    this.endYear,
  });

  factory SeasonSumAggregateOutputType.fromJson(Map json) =>
      SeasonSumAggregateOutputType(
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

class SeasonMinAggregateOutputType {
  const SeasonMinAggregateOutputType({
    this.id,
    this.startYear,
    this.endYear,
  });

  factory SeasonMinAggregateOutputType.fromJson(Map json) =>
      SeasonMinAggregateOutputType(
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

class SeasonMaxAggregateOutputType {
  const SeasonMaxAggregateOutputType({
    this.id,
    this.startYear,
    this.endYear,
  });

  factory SeasonMaxAggregateOutputType.fromJson(Map json) =>
      SeasonMaxAggregateOutputType(
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

class SeasonGroupByOutputType {
  const SeasonGroupByOutputType({
    this.id,
    this.startYear,
    this.endYear,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory SeasonGroupByOutputType.fromJson(Map json) => SeasonGroupByOutputType(
        id: json['id'],
        startYear: json['startYear'],
        endYear: json['endYear'],
        $count: json['_count'] is Map
            ? _i2.SeasonCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.SeasonAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.SeasonSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.SeasonMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.SeasonMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final int? id;

  final int? startYear;

  final int? endYear;

  final _i2.SeasonCountAggregateOutputType? $count;

  final _i2.SeasonAvgAggregateOutputType? $avg;

  final _i2.SeasonSumAggregateOutputType? $sum;

  final _i2.SeasonMinAggregateOutputType? $min;

  final _i2.SeasonMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
        '_count': $count?.toJson(),
        '_avg': $avg?.toJson(),
        '_sum': $sum?.toJson(),
        '_min': $min?.toJson(),
        '_max': $max?.toJson(),
      };
}

class SeasonCountOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonCountOrderByAggregateInput({
    this.id,
    this.startYear,
    this.endYear,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? startYear;

  final _i2.SortOrder? endYear;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
      };
}

class SeasonAvgOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonAvgOrderByAggregateInput({
    this.id,
    this.startYear,
    this.endYear,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? startYear;

  final _i2.SortOrder? endYear;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
      };
}

class SeasonMaxOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonMaxOrderByAggregateInput({
    this.id,
    this.startYear,
    this.endYear,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? startYear;

  final _i2.SortOrder? endYear;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
      };
}

class SeasonMinOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonMinOrderByAggregateInput({
    this.id,
    this.startYear,
    this.endYear,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? startYear;

  final _i2.SortOrder? endYear;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
      };
}

class SeasonSumOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonSumOrderByAggregateInput({
    this.id,
    this.startYear,
    this.endYear,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? startYear;

  final _i2.SortOrder? endYear;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
      };
}

class SeasonOrderByWithAggregationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonOrderByWithAggregationInput({
    this.id,
    this.startYear,
    this.endYear,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? startYear;

  final _i2.SortOrder? endYear;

  final _i2.SeasonCountOrderByAggregateInput? $count;

  final _i2.SeasonAvgOrderByAggregateInput? $avg;

  final _i2.SeasonMaxOrderByAggregateInput? $max;

  final _i2.SeasonMinOrderByAggregateInput? $min;

  final _i2.SeasonSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
        '_count': $count,
        '_avg': $avg,
        '_max': $max,
        '_min': $min,
        '_sum': $sum,
      };
}

class NestedFloatFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedFloatFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<double, _i1.Reference<double>>? equals;

  final Iterable<double>? $in;

  final Iterable<double>? notIn;

  final _i1.PrismaUnion<double, _i1.Reference<double>>? lt;

  final _i1.PrismaUnion<double, _i1.Reference<double>>? lte;

  final _i1.PrismaUnion<double, _i1.Reference<double>>? gt;

  final _i1.PrismaUnion<double, _i1.Reference<double>>? gte;

  final _i1.PrismaUnion<double, _i2.NestedFloatFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'not': not,
      };
}

class NestedIntWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedIntWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<int, _i1.Reference<int>>? equals;

  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lte;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gte;

  final _i1.PrismaUnion<int, _i2.NestedIntWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedFloatFilter? $avg;

  final _i2.NestedIntFilter? $sum;

  final _i2.NestedIntFilter? $min;

  final _i2.NestedIntFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'not': not,
        '_count': $count,
        '_avg': $avg,
        '_sum': $sum,
        '_min': $min,
        '_max': $max,
      };
}

class IntWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const IntWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<int, _i1.Reference<int>>? equals;

  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lte;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gte;

  final _i1.PrismaUnion<int, _i2.NestedIntWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedFloatFilter? $avg;

  final _i2.NestedIntFilter? $sum;

  final _i2.NestedIntFilter? $min;

  final _i2.NestedIntFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'not': not,
        '_count': $count,
        '_avg': $avg,
        '_sum': $sum,
        '_min': $min,
        '_max': $max,
      };
}

class SeasonScalarWhereWithAggregatesInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.startYear,
    this.endYear,
  });

  final _i1.PrismaUnion<_i2.SeasonScalarWhereWithAggregatesInput,
      Iterable<_i2.SeasonScalarWhereWithAggregatesInput>>? AND;

  final Iterable<_i2.SeasonScalarWhereWithAggregatesInput>? OR;

  final _i1.PrismaUnion<_i2.SeasonScalarWhereWithAggregatesInput,
      Iterable<_i2.SeasonScalarWhereWithAggregatesInput>>? NOT;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? id;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? startYear;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? endYear;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
      };
}

class SeasonCountAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonCountAggregateOutputTypeSelect({
    this.id,
    this.startYear,
    this.endYear,
    this.$all,
  });

  final bool? id;

  final bool? startYear;

  final bool? endYear;

  final bool? $all;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
        '_all': $all,
      };
}

class SeasonGroupByOutputTypeCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonGroupByOutputTypeCountArgs({this.select});

  final _i2.SeasonCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class SeasonAvgAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonAvgAggregateOutputTypeSelect({
    this.id,
    this.startYear,
    this.endYear,
  });

  final bool? id;

  final bool? startYear;

  final bool? endYear;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
      };
}

class SeasonGroupByOutputTypeAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonGroupByOutputTypeAvgArgs({this.select});

  final _i2.SeasonAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class SeasonSumAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonSumAggregateOutputTypeSelect({
    this.id,
    this.startYear,
    this.endYear,
  });

  final bool? id;

  final bool? startYear;

  final bool? endYear;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
      };
}

class SeasonGroupByOutputTypeSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonGroupByOutputTypeSumArgs({this.select});

  final _i2.SeasonSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class SeasonMinAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonMinAggregateOutputTypeSelect({
    this.id,
    this.startYear,
    this.endYear,
  });

  final bool? id;

  final bool? startYear;

  final bool? endYear;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
      };
}

class SeasonGroupByOutputTypeMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonGroupByOutputTypeMinArgs({this.select});

  final _i2.SeasonMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class SeasonMaxAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonMaxAggregateOutputTypeSelect({
    this.id,
    this.startYear,
    this.endYear,
  });

  final bool? id;

  final bool? startYear;

  final bool? endYear;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
      };
}

class SeasonGroupByOutputTypeMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonGroupByOutputTypeMaxArgs({this.select});

  final _i2.SeasonMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class SeasonGroupByOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SeasonGroupByOutputTypeSelect({
    this.id,
    this.startYear,
    this.endYear,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final bool? id;

  final bool? startYear;

  final bool? endYear;

  final _i1.PrismaUnion<bool, _i2.SeasonGroupByOutputTypeCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.SeasonGroupByOutputTypeAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.SeasonGroupByOutputTypeSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.SeasonGroupByOutputTypeMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.SeasonGroupByOutputTypeMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'startYear': startYear,
        'endYear': endYear,
        '_count': $count,
        '_avg': $avg,
        '_sum': $sum,
        '_min': $min,
        '_max': $max,
      };
}

class AggregateSeason {
  const AggregateSeason({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory AggregateSeason.fromJson(Map json) => AggregateSeason(
        $count: json['_count'] is Map
            ? _i2.SeasonCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.SeasonAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.SeasonSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.SeasonMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.SeasonMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final _i2.SeasonCountAggregateOutputType? $count;

  final _i2.SeasonAvgAggregateOutputType? $avg;

  final _i2.SeasonSumAggregateOutputType? $sum;

  final _i2.SeasonMinAggregateOutputType? $min;

  final _i2.SeasonMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
        '_count': $count?.toJson(),
        '_avg': $avg?.toJson(),
        '_sum': $sum?.toJson(),
        '_min': $min?.toJson(),
        '_max': $max?.toJson(),
      };
}

class AggregateSeasonCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateSeasonCountArgs({this.select});

  final _i2.SeasonCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateSeasonAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateSeasonAvgArgs({this.select});

  final _i2.SeasonAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateSeasonSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateSeasonSumArgs({this.select});

  final _i2.SeasonSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateSeasonMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateSeasonMinArgs({this.select});

  final _i2.SeasonMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateSeasonMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateSeasonMaxArgs({this.select});

  final _i2.SeasonMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateSeasonSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateSeasonSelect({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i2.AggregateSeasonCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AggregateSeasonAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.AggregateSeasonSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.AggregateSeasonMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AggregateSeasonMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
        '_count': $count,
        '_avg': $avg,
        '_sum': $sum,
        '_min': $min,
        '_max': $max,
      };
}

class TeamCountOutputType {
  const TeamCountOutputType({
    this.game,
    this.player,
  });

  factory TeamCountOutputType.fromJson(Map json) => TeamCountOutputType(
        game: json['Game'],
        player: json['Player'],
      );

  final int? game;

  final int? player;

  Map<String, dynamic> toJson() => {
        'Game': game,
        'Player': player,
      };
}

class NestedStringFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedStringFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
  });

  final _i1.PrismaUnion<String, _i1.Reference<String>>? equals;

  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<String, _i2.NestedStringFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'not': not,
      };
}

class StringFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
  });

  final _i1.PrismaUnion<String, _i1.Reference<String>>? equals;

  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<String, _i2.NestedStringFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'not': not,
      };
}

class NestedDateTimeFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedDateTimeFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? equals;

  final Iterable<DateTime>? $in;

  final Iterable<DateTime>? notIn;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lte;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gte;

  final _i1.PrismaUnion<DateTime, _i2.NestedDateTimeFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'not': not,
      };
}

class DateTimeFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const DateTimeFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? equals;

  final Iterable<DateTime>? $in;

  final Iterable<DateTime>? notIn;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lte;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gte;

  final _i1.PrismaUnion<DateTime, _i2.NestedDateTimeFilter>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'not': not,
      };
}

class GameListRelationFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameListRelationFilter({
    this.every,
    this.some,
    this.none,
  });

  final _i2.GameWhereInput? every;

  final _i2.GameWhereInput? some;

  final _i2.GameWhereInput? none;

  @override
  Map<String, dynamic> toJson() => {
        'every': every,
        'some': some,
        'none': none,
      };
}

class PlayerWhereInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
    this.team,
  });

  final _i1.PrismaUnion<_i2.PlayerWhereInput, Iterable<_i2.PlayerWhereInput>>?
      AND;

  final Iterable<_i2.PlayerWhereInput>? OR;

  final _i1.PrismaUnion<_i2.PlayerWhereInput, Iterable<_i2.PlayerWhereInput>>?
      NOT;

  final _i1.PrismaUnion<_i2.IntFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? lastName;

  final _i1.PrismaUnion<_i2.StringFilter, String>? firstName;

  final _i1.PrismaUnion<_i2.StringFilter, String>? middleName;

  final _i1.PrismaUnion<_i2.IntFilter, int>? jerseyNumber;

  final _i1.PrismaUnion<_i2.IntFilter, int>? gamesPlayed;

  final _i1.PrismaUnion<_i2.IntFilter, int>? teamID;

  final _i1.PrismaUnion<_i2.TeamRelationFilter, _i2.TeamWhereInput>? team;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
        'team': team,
      };
}

class PlayerListRelationFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerListRelationFilter({
    this.every,
    this.some,
    this.none,
  });

  final _i2.PlayerWhereInput? every;

  final _i2.PlayerWhereInput? some;

  final _i2.PlayerWhereInput? none;

  @override
  Map<String, dynamic> toJson() => {
        'every': every,
        'some': some,
        'none': none,
      };
}

class TeamWhereInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.name,
    this.game,
    this.player,
  });

  final _i1.PrismaUnion<_i2.TeamWhereInput, Iterable<_i2.TeamWhereInput>>? AND;

  final Iterable<_i2.TeamWhereInput>? OR;

  final _i1.PrismaUnion<_i2.TeamWhereInput, Iterable<_i2.TeamWhereInput>>? NOT;

  final _i1.PrismaUnion<_i2.IntFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? name;

  final _i2.GameListRelationFilter? game;

  final _i2.PlayerListRelationFilter? player;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'name': name,
        'Game': game,
        'Player': player,
      };
}

class TeamRelationFilter implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamRelationFilter({
    this.$is,
    this.isNot,
  });

  final _i2.TeamWhereInput? $is;

  final _i2.TeamWhereInput? isNot;

  @override
  Map<String, dynamic> toJson() => {
        'is': $is,
        'isNot': isNot,
      };
}

class GameWhereInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.title,
    this.date,
    this.semester,
    this.teamID,
    this.team,
  });

  final _i1.PrismaUnion<_i2.GameWhereInput, Iterable<_i2.GameWhereInput>>? AND;

  final Iterable<_i2.GameWhereInput>? OR;

  final _i1.PrismaUnion<_i2.GameWhereInput, Iterable<_i2.GameWhereInput>>? NOT;

  final _i1.PrismaUnion<_i2.IntFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? title;

  final _i1.PrismaUnion<_i2.DateTimeFilter, DateTime>? date;

  final _i1.PrismaUnion<_i2.StringFilter, String>? semester;

  final _i1.PrismaUnion<_i2.IntFilter, int>? teamID;

  final _i1.PrismaUnion<_i2.TeamRelationFilter, _i2.TeamWhereInput>? team;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
        'teamID': teamID,
        'team': team,
      };
}

class GameWhereUniqueInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameWhereUniqueInput({
    this.id,
    this.AND,
    this.OR,
    this.NOT,
    this.title,
    this.date,
    this.semester,
    this.teamID,
    this.team,
  });

  final int? id;

  final _i1.PrismaUnion<_i2.GameWhereInput, Iterable<_i2.GameWhereInput>>? AND;

  final Iterable<_i2.GameWhereInput>? OR;

  final _i1.PrismaUnion<_i2.GameWhereInput, Iterable<_i2.GameWhereInput>>? NOT;

  final _i1.PrismaUnion<_i2.StringFilter, String>? title;

  final _i1.PrismaUnion<_i2.DateTimeFilter, DateTime>? date;

  final _i1.PrismaUnion<_i2.StringFilter, String>? semester;

  final _i1.PrismaUnion<_i2.IntFilter, int>? teamID;

  final _i1.PrismaUnion<_i2.TeamRelationFilter, _i2.TeamWhereInput>? team;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'title': title,
        'date': date,
        'semester': semester,
        'teamID': teamID,
        'team': team,
      };
}

class GameOrderByRelationAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameOrderByRelationAggregateInput({this.$count});

  final _i2.SortOrder? $count;

  @override
  Map<String, dynamic> toJson() => {'_count': $count};
}

class PlayerOrderByRelationAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerOrderByRelationAggregateInput({this.$count});

  final _i2.SortOrder? $count;

  @override
  Map<String, dynamic> toJson() => {'_count': $count};
}

class TeamOrderByWithRelationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamOrderByWithRelationInput({
    this.id,
    this.name,
    this.game,
    this.player,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? name;

  final _i2.GameOrderByRelationAggregateInput? game;

  final _i2.PlayerOrderByRelationAggregateInput? player;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'Game': game,
        'Player': player,
      };
}

class GameOrderByWithRelationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameOrderByWithRelationInput({
    this.id,
    this.title,
    this.date,
    this.semester,
    this.teamID,
    this.team,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? title;

  final _i2.SortOrder? date;

  final _i2.SortOrder? semester;

  final _i2.SortOrder? teamID;

  final _i2.TeamOrderByWithRelationInput? team;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
        'teamID': teamID,
        'team': team,
      };
}

enum GameScalar<T> implements _i1.PrismaEnum, _i1.Reference<T> {
  id<int>('id', 'Game'),
  title<String>('title', 'Game'),
  date<DateTime>('date', 'Game'),
  semester<String>('semester', 'Game'),
  teamID<int>('teamID', 'Game');

  const GameScalar(
    this.name,
    this.model,
  );

  @override
  final String name;

  @override
  final String model;
}

class TeamGameArgs implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamGameArgs({
    this.where,
    this.orderBy,
    this.cursor,
    this.take,
    this.skip,
    this.distinct,
    this.select,
    this.include,
  });

  final _i2.GameWhereInput? where;

  final _i1.PrismaUnion<Iterable<_i2.GameOrderByWithRelationInput>,
      _i2.GameOrderByWithRelationInput>? orderBy;

  final _i2.GameWhereUniqueInput? cursor;

  final int? take;

  final int? skip;

  final _i1.PrismaUnion<_i2.GameScalar, Iterable<_i2.GameScalar>>? distinct;

  final _i2.GameSelect? select;

  final _i2.GameInclude? include;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'orderBy': orderBy,
        'cursor': cursor,
        'take': take,
        'skip': skip,
        'distinct': distinct,
        'select': select,
        'include': include,
      };
}

class PlayerTeamArgs implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerTeamArgs({
    this.select,
    this.include,
  });

  final _i2.TeamSelect? select;

  final _i2.TeamInclude? include;

  @override
  Map<String, dynamic> toJson() => {
        'select': select,
        'include': include,
      };
}

class PlayerSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerSelect({
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
    this.team,
  });

  final bool? id;

  final bool? lastName;

  final bool? firstName;

  final bool? middleName;

  final bool? jerseyNumber;

  final bool? gamesPlayed;

  final bool? teamID;

  final _i1.PrismaUnion<bool, _i2.PlayerTeamArgs>? team;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
        'team': team,
      };
}

class PlayerInclude implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerInclude({this.team});

  final _i1.PrismaUnion<bool, _i2.PlayerTeamArgs>? team;

  @override
  Map<String, dynamic> toJson() => {'team': team};
}

class PlayerOrderByWithRelationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerOrderByWithRelationInput({
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
    this.team,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? lastName;

  final _i2.SortOrder? firstName;

  final _i2.SortOrder? middleName;

  final _i2.SortOrder? jerseyNumber;

  final _i2.SortOrder? gamesPlayed;

  final _i2.SortOrder? teamID;

  final _i2.TeamOrderByWithRelationInput? team;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
        'team': team,
      };
}

class PlayerWhereUniqueInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerWhereUniqueInput({
    this.id,
    this.AND,
    this.OR,
    this.NOT,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
    this.team,
  });

  final int? id;

  final _i1.PrismaUnion<_i2.PlayerWhereInput, Iterable<_i2.PlayerWhereInput>>?
      AND;

  final Iterable<_i2.PlayerWhereInput>? OR;

  final _i1.PrismaUnion<_i2.PlayerWhereInput, Iterable<_i2.PlayerWhereInput>>?
      NOT;

  final _i1.PrismaUnion<_i2.StringFilter, String>? lastName;

  final _i1.PrismaUnion<_i2.StringFilter, String>? firstName;

  final _i1.PrismaUnion<_i2.StringFilter, String>? middleName;

  final _i1.PrismaUnion<_i2.IntFilter, int>? jerseyNumber;

  final _i1.PrismaUnion<_i2.IntFilter, int>? gamesPlayed;

  final _i1.PrismaUnion<_i2.IntFilter, int>? teamID;

  final _i1.PrismaUnion<_i2.TeamRelationFilter, _i2.TeamWhereInput>? team;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
        'team': team,
      };
}

enum PlayerScalar<T> implements _i1.PrismaEnum, _i1.Reference<T> {
  id<int>('id', 'Player'),
  lastName<String>('lastName', 'Player'),
  firstName<String>('firstName', 'Player'),
  middleName<String>('middleName', 'Player'),
  jerseyNumber<int>('jerseyNumber', 'Player'),
  gamesPlayed<int>('gamesPlayed', 'Player'),
  teamID<int>('teamID', 'Player');

  const PlayerScalar(
    this.name,
    this.model,
  );

  @override
  final String name;

  @override
  final String model;
}

class TeamPlayerArgs implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamPlayerArgs({
    this.where,
    this.orderBy,
    this.cursor,
    this.take,
    this.skip,
    this.distinct,
    this.select,
    this.include,
  });

  final _i2.PlayerWhereInput? where;

  final _i1.PrismaUnion<Iterable<_i2.PlayerOrderByWithRelationInput>,
      _i2.PlayerOrderByWithRelationInput>? orderBy;

  final _i2.PlayerWhereUniqueInput? cursor;

  final int? take;

  final int? skip;

  final _i1.PrismaUnion<_i2.PlayerScalar, Iterable<_i2.PlayerScalar>>? distinct;

  final _i2.PlayerSelect? select;

  final _i2.PlayerInclude? include;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'orderBy': orderBy,
        'cursor': cursor,
        'take': take,
        'skip': skip,
        'distinct': distinct,
        'select': select,
        'include': include,
      };
}

class TeamCountOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamCountOutputTypeSelect({
    this.game,
    this.player,
  });

  final bool? game;

  final bool? player;

  @override
  Map<String, dynamic> toJson() => {
        'Game': game,
        'Player': player,
      };
}

class TeamCountArgs implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamCountArgs({this.select});

  final _i2.TeamCountOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class TeamInclude implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamInclude({
    this.game,
    this.player,
    this.$count,
  });

  final _i1.PrismaUnion<bool, _i2.TeamGameArgs>? game;

  final _i1.PrismaUnion<bool, _i2.TeamPlayerArgs>? player;

  final _i1.PrismaUnion<bool, _i2.TeamCountArgs>? $count;

  @override
  Map<String, dynamic> toJson() => {
        'Game': game,
        'Player': player,
        '_count': $count,
      };
}

class GameTeamArgs implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameTeamArgs({
    this.select,
    this.include,
  });

  final _i2.TeamSelect? select;

  final _i2.TeamInclude? include;

  @override
  Map<String, dynamic> toJson() => {
        'select': select,
        'include': include,
      };
}

class GameInclude implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameInclude({this.team});

  final _i1.PrismaUnion<bool, _i2.GameTeamArgs>? team;

  @override
  Map<String, dynamic> toJson() => {'team': team};
}

class TeamSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamSelect({
    this.id,
    this.name,
    this.game,
    this.player,
    this.$count,
  });

  final bool? id;

  final bool? name;

  final _i1.PrismaUnion<bool, _i2.TeamGameArgs>? game;

  final _i1.PrismaUnion<bool, _i2.TeamPlayerArgs>? player;

  final _i1.PrismaUnion<bool, _i2.TeamCountArgs>? $count;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'Game': game,
        'Player': player,
        '_count': $count,
      };
}

class GameSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameSelect({
    this.id,
    this.title,
    this.date,
    this.semester,
    this.teamID,
    this.team,
  });

  final bool? id;

  final bool? title;

  final bool? date;

  final bool? semester;

  final bool? teamID;

  final _i1.PrismaUnion<bool, _i2.GameTeamArgs>? team;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
        'teamID': teamID,
        'team': team,
      };
}

class PlayerCreateWithoutTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerCreateWithoutTeamInput({
    required this.lastName,
    required this.firstName,
    required this.middleName,
    required this.jerseyNumber,
    required this.gamesPlayed,
  });

  final String lastName;

  final String firstName;

  final String middleName;

  final int jerseyNumber;

  final int gamesPlayed;

  @override
  Map<String, dynamic> toJson() => {
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
      };
}

class PlayerUncheckedCreateWithoutTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerUncheckedCreateWithoutTeamInput({
    this.id,
    required this.lastName,
    required this.firstName,
    required this.middleName,
    required this.jerseyNumber,
    required this.gamesPlayed,
  });

  final int? id;

  final String lastName;

  final String firstName;

  final String middleName;

  final int jerseyNumber;

  final int gamesPlayed;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
      };
}

class PlayerCreateOrConnectWithoutTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerCreateOrConnectWithoutTeamInput({
    required this.where,
    required this.create,
  });

  final _i2.PlayerWhereUniqueInput where;

  final _i1.PrismaUnion<_i2.PlayerCreateWithoutTeamInput,
      _i2.PlayerUncheckedCreateWithoutTeamInput> create;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'create': create,
      };
}

class PlayerCreateManyTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerCreateManyTeamInput({
    this.id,
    required this.lastName,
    required this.firstName,
    required this.middleName,
    required this.jerseyNumber,
    required this.gamesPlayed,
  });

  final int? id;

  final String lastName;

  final String firstName;

  final String middleName;

  final int jerseyNumber;

  final int gamesPlayed;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
      };
}

class PlayerCreateManyTeamInputEnvelope
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerCreateManyTeamInputEnvelope({required this.data});

  final _i1.PrismaUnion<_i2.PlayerCreateManyTeamInput,
      Iterable<_i2.PlayerCreateManyTeamInput>> data;

  @override
  Map<String, dynamic> toJson() => {'data': data};
}

class PlayerCreateNestedManyWithoutTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerCreateNestedManyWithoutTeamInput({
    this.create,
    this.connectOrCreate,
    this.createMany,
    this.connect,
  });

  final _i1.PrismaUnion<
      _i2.PlayerCreateWithoutTeamInput,
      _i1.PrismaUnion<
          Iterable<_i2.PlayerCreateWithoutTeamInput>,
          _i1.PrismaUnion<_i2.PlayerUncheckedCreateWithoutTeamInput,
              Iterable<_i2.PlayerUncheckedCreateWithoutTeamInput>>>>? create;

  final _i1.PrismaUnion<_i2.PlayerCreateOrConnectWithoutTeamInput,
      Iterable<_i2.PlayerCreateOrConnectWithoutTeamInput>>? connectOrCreate;

  final _i2.PlayerCreateManyTeamInputEnvelope? createMany;

  final _i1.PrismaUnion<_i2.PlayerWhereUniqueInput,
      Iterable<_i2.PlayerWhereUniqueInput>>? connect;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'createMany': createMany,
        'connect': connect,
      };
}

class TeamCreateWithoutGameInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamCreateWithoutGameInput({
    required this.name,
    this.player,
  });

  final String name;

  final _i2.PlayerCreateNestedManyWithoutTeamInput? player;

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'Player': player,
      };
}

class PlayerUncheckedCreateNestedManyWithoutTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerUncheckedCreateNestedManyWithoutTeamInput({
    this.create,
    this.connectOrCreate,
    this.createMany,
    this.connect,
  });

  final _i1.PrismaUnion<
      _i2.PlayerCreateWithoutTeamInput,
      _i1.PrismaUnion<
          Iterable<_i2.PlayerCreateWithoutTeamInput>,
          _i1.PrismaUnion<_i2.PlayerUncheckedCreateWithoutTeamInput,
              Iterable<_i2.PlayerUncheckedCreateWithoutTeamInput>>>>? create;

  final _i1.PrismaUnion<_i2.PlayerCreateOrConnectWithoutTeamInput,
      Iterable<_i2.PlayerCreateOrConnectWithoutTeamInput>>? connectOrCreate;

  final _i2.PlayerCreateManyTeamInputEnvelope? createMany;

  final _i1.PrismaUnion<_i2.PlayerWhereUniqueInput,
      Iterable<_i2.PlayerWhereUniqueInput>>? connect;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'createMany': createMany,
        'connect': connect,
      };
}

class TeamUncheckedCreateWithoutGameInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamUncheckedCreateWithoutGameInput({
    this.id,
    required this.name,
    this.player,
  });

  final int? id;

  final String name;

  final _i2.PlayerUncheckedCreateNestedManyWithoutTeamInput? player;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'Player': player,
      };
}

class TeamWhereUniqueInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamWhereUniqueInput({
    this.id,
    this.AND,
    this.OR,
    this.NOT,
    this.name,
    this.game,
    this.player,
  });

  final int? id;

  final _i1.PrismaUnion<_i2.TeamWhereInput, Iterable<_i2.TeamWhereInput>>? AND;

  final Iterable<_i2.TeamWhereInput>? OR;

  final _i1.PrismaUnion<_i2.TeamWhereInput, Iterable<_i2.TeamWhereInput>>? NOT;

  final _i1.PrismaUnion<_i2.StringFilter, String>? name;

  final _i2.GameListRelationFilter? game;

  final _i2.PlayerListRelationFilter? player;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'name': name,
        'Game': game,
        'Player': player,
      };
}

class TeamCreateOrConnectWithoutGameInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamCreateOrConnectWithoutGameInput({
    required this.where,
    required this.create,
  });

  final _i2.TeamWhereUniqueInput where;

  final _i1.PrismaUnion<_i2.TeamCreateWithoutGameInput,
      _i2.TeamUncheckedCreateWithoutGameInput> create;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'create': create,
      };
}

class TeamCreateNestedOneWithoutGameInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamCreateNestedOneWithoutGameInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  final _i1.PrismaUnion<_i2.TeamCreateWithoutGameInput,
      _i2.TeamUncheckedCreateWithoutGameInput>? create;

  final _i2.TeamCreateOrConnectWithoutGameInput? connectOrCreate;

  final _i2.TeamWhereUniqueInput? connect;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'connect': connect,
      };
}

class GameCreateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameCreateInput({
    required this.title,
    required this.date,
    required this.semester,
    required this.team,
  });

  final String title;

  final DateTime date;

  final String semester;

  final _i2.TeamCreateNestedOneWithoutGameInput team;

  @override
  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'semester': semester,
        'team': team,
      };
}

class GameUncheckedCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameUncheckedCreateInput({
    this.id,
    required this.title,
    required this.date,
    required this.semester,
    required this.teamID,
  });

  final int? id;

  final String title;

  final DateTime date;

  final String semester;

  final int teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
        'teamID': teamID,
      };
}

class GameCreateManyInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameCreateManyInput({
    this.id,
    required this.title,
    required this.date,
    required this.semester,
    required this.teamID,
  });

  final int? id;

  final String title;

  final DateTime date;

  final String semester;

  final int teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
        'teamID': teamID,
      };
}

class CreateManyGameAndReturnOutputTypeTeamArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const CreateManyGameAndReturnOutputTypeTeamArgs({
    this.select,
    this.include,
  });

  final _i2.TeamSelect? select;

  final _i2.TeamInclude? include;

  @override
  Map<String, dynamic> toJson() => {
        'select': select,
        'include': include,
      };
}

class CreateManyGameAndReturnOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const CreateManyGameAndReturnOutputTypeSelect({
    this.id,
    this.title,
    this.date,
    this.semester,
    this.teamID,
    this.team,
  });

  final bool? id;

  final bool? title;

  final bool? date;

  final bool? semester;

  final bool? teamID;

  final _i1.PrismaUnion<bool, _i2.CreateManyGameAndReturnOutputTypeTeamArgs>?
      team;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
        'teamID': teamID,
        'team': team,
      };
}

class CreateManyGameAndReturnOutputTypeInclude
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const CreateManyGameAndReturnOutputTypeInclude({this.team});

  final _i1.PrismaUnion<bool, _i2.CreateManyGameAndReturnOutputTypeTeamArgs>?
      team;

  @override
  Map<String, dynamic> toJson() => {'team': team};
}

class StringFieldUpdateOperationsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringFieldUpdateOperationsInput({this.set});

  final String? set;

  @override
  Map<String, dynamic> toJson() => {'set': set};
}

class DateTimeFieldUpdateOperationsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const DateTimeFieldUpdateOperationsInput({this.set});

  final DateTime? set;

  @override
  Map<String, dynamic> toJson() => {'set': set};
}

class PlayerUpdateWithoutTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerUpdateWithoutTeamInput({
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? lastName;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      firstName;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      middleName;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? jerseyNumber;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? gamesPlayed;

  @override
  Map<String, dynamic> toJson() => {
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
      };
}

class PlayerUncheckedUpdateWithoutTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerUncheckedUpdateWithoutTeamInput({
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? lastName;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      firstName;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      middleName;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? jerseyNumber;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? gamesPlayed;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
      };
}

class PlayerUpsertWithWhereUniqueWithoutTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerUpsertWithWhereUniqueWithoutTeamInput({
    required this.where,
    required this.update,
    required this.create,
  });

  final _i2.PlayerWhereUniqueInput where;

  final _i1.PrismaUnion<_i2.PlayerUpdateWithoutTeamInput,
      _i2.PlayerUncheckedUpdateWithoutTeamInput> update;

  final _i1.PrismaUnion<_i2.PlayerCreateWithoutTeamInput,
      _i2.PlayerUncheckedCreateWithoutTeamInput> create;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'update': update,
        'create': create,
      };
}

class PlayerUpdateWithWhereUniqueWithoutTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerUpdateWithWhereUniqueWithoutTeamInput({
    required this.where,
    required this.data,
  });

  final _i2.PlayerWhereUniqueInput where;

  final _i1.PrismaUnion<_i2.PlayerUpdateWithoutTeamInput,
      _i2.PlayerUncheckedUpdateWithoutTeamInput> data;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'data': data,
      };
}

class PlayerScalarWhereInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerScalarWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
  });

  final _i1.PrismaUnion<_i2.PlayerScalarWhereInput,
      Iterable<_i2.PlayerScalarWhereInput>>? AND;

  final Iterable<_i2.PlayerScalarWhereInput>? OR;

  final _i1.PrismaUnion<_i2.PlayerScalarWhereInput,
      Iterable<_i2.PlayerScalarWhereInput>>? NOT;

  final _i1.PrismaUnion<_i2.IntFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? lastName;

  final _i1.PrismaUnion<_i2.StringFilter, String>? firstName;

  final _i1.PrismaUnion<_i2.StringFilter, String>? middleName;

  final _i1.PrismaUnion<_i2.IntFilter, int>? jerseyNumber;

  final _i1.PrismaUnion<_i2.IntFilter, int>? gamesPlayed;

  final _i1.PrismaUnion<_i2.IntFilter, int>? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
      };
}

class PlayerUpdateManyMutationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerUpdateManyMutationInput({
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? lastName;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      firstName;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      middleName;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? jerseyNumber;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? gamesPlayed;

  @override
  Map<String, dynamic> toJson() => {
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
      };
}

class PlayerUncheckedUpdateManyWithoutTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerUncheckedUpdateManyWithoutTeamInput({
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? lastName;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      firstName;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      middleName;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? jerseyNumber;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? gamesPlayed;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
      };
}

class PlayerUpdateManyWithWhereWithoutTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerUpdateManyWithWhereWithoutTeamInput({
    required this.where,
    required this.data,
  });

  final _i2.PlayerScalarWhereInput where;

  final _i1.PrismaUnion<_i2.PlayerUpdateManyMutationInput,
      _i2.PlayerUncheckedUpdateManyWithoutTeamInput> data;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'data': data,
      };
}

class PlayerUpdateManyWithoutTeamNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerUpdateManyWithoutTeamNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.createMany,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  final _i1.PrismaUnion<
      _i2.PlayerCreateWithoutTeamInput,
      _i1.PrismaUnion<
          Iterable<_i2.PlayerCreateWithoutTeamInput>,
          _i1.PrismaUnion<_i2.PlayerUncheckedCreateWithoutTeamInput,
              Iterable<_i2.PlayerUncheckedCreateWithoutTeamInput>>>>? create;

  final _i1.PrismaUnion<_i2.PlayerCreateOrConnectWithoutTeamInput,
      Iterable<_i2.PlayerCreateOrConnectWithoutTeamInput>>? connectOrCreate;

  final _i1.PrismaUnion<_i2.PlayerUpsertWithWhereUniqueWithoutTeamInput,
      Iterable<_i2.PlayerUpsertWithWhereUniqueWithoutTeamInput>>? upsert;

  final _i2.PlayerCreateManyTeamInputEnvelope? createMany;

  final _i1.PrismaUnion<_i2.PlayerWhereUniqueInput,
      Iterable<_i2.PlayerWhereUniqueInput>>? set;

  final _i1.PrismaUnion<_i2.PlayerWhereUniqueInput,
      Iterable<_i2.PlayerWhereUniqueInput>>? disconnect;

  final _i1.PrismaUnion<_i2.PlayerWhereUniqueInput,
      Iterable<_i2.PlayerWhereUniqueInput>>? delete;

  final _i1.PrismaUnion<_i2.PlayerWhereUniqueInput,
      Iterable<_i2.PlayerWhereUniqueInput>>? connect;

  final _i1.PrismaUnion<_i2.PlayerUpdateWithWhereUniqueWithoutTeamInput,
      Iterable<_i2.PlayerUpdateWithWhereUniqueWithoutTeamInput>>? update;

  final _i1.PrismaUnion<_i2.PlayerUpdateManyWithWhereWithoutTeamInput,
      Iterable<_i2.PlayerUpdateManyWithWhereWithoutTeamInput>>? updateMany;

  final _i1.PrismaUnion<_i2.PlayerScalarWhereInput,
      Iterable<_i2.PlayerScalarWhereInput>>? deleteMany;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'upsert': upsert,
        'createMany': createMany,
        'set': set,
        'disconnect': disconnect,
        'delete': delete,
        'connect': connect,
        'update': update,
        'updateMany': updateMany,
        'deleteMany': deleteMany,
      };
}

class TeamUpdateWithoutGameInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamUpdateWithoutGameInput({
    this.name,
    this.player,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? name;

  final _i2.PlayerUpdateManyWithoutTeamNestedInput? player;

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'Player': player,
      };
}

class PlayerUncheckedUpdateManyWithoutTeamNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerUncheckedUpdateManyWithoutTeamNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.createMany,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  final _i1.PrismaUnion<
      _i2.PlayerCreateWithoutTeamInput,
      _i1.PrismaUnion<
          Iterable<_i2.PlayerCreateWithoutTeamInput>,
          _i1.PrismaUnion<_i2.PlayerUncheckedCreateWithoutTeamInput,
              Iterable<_i2.PlayerUncheckedCreateWithoutTeamInput>>>>? create;

  final _i1.PrismaUnion<_i2.PlayerCreateOrConnectWithoutTeamInput,
      Iterable<_i2.PlayerCreateOrConnectWithoutTeamInput>>? connectOrCreate;

  final _i1.PrismaUnion<_i2.PlayerUpsertWithWhereUniqueWithoutTeamInput,
      Iterable<_i2.PlayerUpsertWithWhereUniqueWithoutTeamInput>>? upsert;

  final _i2.PlayerCreateManyTeamInputEnvelope? createMany;

  final _i1.PrismaUnion<_i2.PlayerWhereUniqueInput,
      Iterable<_i2.PlayerWhereUniqueInput>>? set;

  final _i1.PrismaUnion<_i2.PlayerWhereUniqueInput,
      Iterable<_i2.PlayerWhereUniqueInput>>? disconnect;

  final _i1.PrismaUnion<_i2.PlayerWhereUniqueInput,
      Iterable<_i2.PlayerWhereUniqueInput>>? delete;

  final _i1.PrismaUnion<_i2.PlayerWhereUniqueInput,
      Iterable<_i2.PlayerWhereUniqueInput>>? connect;

  final _i1.PrismaUnion<_i2.PlayerUpdateWithWhereUniqueWithoutTeamInput,
      Iterable<_i2.PlayerUpdateWithWhereUniqueWithoutTeamInput>>? update;

  final _i1.PrismaUnion<_i2.PlayerUpdateManyWithWhereWithoutTeamInput,
      Iterable<_i2.PlayerUpdateManyWithWhereWithoutTeamInput>>? updateMany;

  final _i1.PrismaUnion<_i2.PlayerScalarWhereInput,
      Iterable<_i2.PlayerScalarWhereInput>>? deleteMany;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'upsert': upsert,
        'createMany': createMany,
        'set': set,
        'disconnect': disconnect,
        'delete': delete,
        'connect': connect,
        'update': update,
        'updateMany': updateMany,
        'deleteMany': deleteMany,
      };
}

class TeamUncheckedUpdateWithoutGameInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamUncheckedUpdateWithoutGameInput({
    this.id,
    this.name,
    this.player,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? name;

  final _i2.PlayerUncheckedUpdateManyWithoutTeamNestedInput? player;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'Player': player,
      };
}

class TeamUpsertWithoutGameInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamUpsertWithoutGameInput({
    required this.update,
    required this.create,
    this.where,
  });

  final _i1.PrismaUnion<_i2.TeamUpdateWithoutGameInput,
      _i2.TeamUncheckedUpdateWithoutGameInput> update;

  final _i1.PrismaUnion<_i2.TeamCreateWithoutGameInput,
      _i2.TeamUncheckedCreateWithoutGameInput> create;

  final _i2.TeamWhereInput? where;

  @override
  Map<String, dynamic> toJson() => {
        'update': update,
        'create': create,
        'where': where,
      };
}

class TeamUpdateToOneWithWhereWithoutGameInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamUpdateToOneWithWhereWithoutGameInput({
    this.where,
    required this.data,
  });

  final _i2.TeamWhereInput? where;

  final _i1.PrismaUnion<_i2.TeamUpdateWithoutGameInput,
      _i2.TeamUncheckedUpdateWithoutGameInput> data;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'data': data,
      };
}

class TeamUpdateOneRequiredWithoutGameNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamUpdateOneRequiredWithoutGameNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.connect,
    this.update,
  });

  final _i1.PrismaUnion<_i2.TeamCreateWithoutGameInput,
      _i2.TeamUncheckedCreateWithoutGameInput>? create;

  final _i2.TeamCreateOrConnectWithoutGameInput? connectOrCreate;

  final _i2.TeamUpsertWithoutGameInput? upsert;

  final _i2.TeamWhereUniqueInput? connect;

  final _i1.PrismaUnion<
      _i2.TeamUpdateToOneWithWhereWithoutGameInput,
      _i1.PrismaUnion<_i2.TeamUpdateWithoutGameInput,
          _i2.TeamUncheckedUpdateWithoutGameInput>>? update;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'upsert': upsert,
        'connect': connect,
        'update': update,
      };
}

class GameUpdateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameUpdateInput({
    this.title,
    this.date,
    this.semester,
    this.team,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? title;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>? date;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? semester;

  final _i2.TeamUpdateOneRequiredWithoutGameNestedInput? team;

  @override
  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'semester': semester,
        'team': team,
      };
}

class GameUncheckedUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameUncheckedUpdateInput({
    this.id,
    this.title,
    this.date,
    this.semester,
    this.teamID,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? title;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>? date;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? semester;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
        'teamID': teamID,
      };
}

class GameUpdateManyMutationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameUpdateManyMutationInput({
    this.title,
    this.date,
    this.semester,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? title;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>? date;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? semester;

  @override
  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'semester': semester,
      };
}

class GameUncheckedUpdateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameUncheckedUpdateManyInput({
    this.id,
    this.title,
    this.date,
    this.semester,
    this.teamID,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? title;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>? date;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? semester;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
        'teamID': teamID,
      };
}

class GameCountAggregateOutputType {
  const GameCountAggregateOutputType({
    this.id,
    this.title,
    this.date,
    this.semester,
    this.teamID,
    this.$all,
  });

  factory GameCountAggregateOutputType.fromJson(Map json) =>
      GameCountAggregateOutputType(
        id: json['id'],
        title: json['title'],
        date: json['date'],
        semester: json['semester'],
        teamID: json['teamID'],
        $all: json['_all'],
      );

  final int? id;

  final int? title;

  final int? date;

  final int? semester;

  final int? teamID;

  final int? $all;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
        'teamID': teamID,
        '_all': $all,
      };
}

class GameAvgAggregateOutputType {
  const GameAvgAggregateOutputType({
    this.id,
    this.teamID,
  });

  factory GameAvgAggregateOutputType.fromJson(Map json) =>
      GameAvgAggregateOutputType(
        id: json['id'],
        teamID: json['teamID'],
      );

  final double? id;

  final double? teamID;

  Map<String, dynamic> toJson() => {
        'id': id,
        'teamID': teamID,
      };
}

class GameSumAggregateOutputType {
  const GameSumAggregateOutputType({
    this.id,
    this.teamID,
  });

  factory GameSumAggregateOutputType.fromJson(Map json) =>
      GameSumAggregateOutputType(
        id: json['id'],
        teamID: json['teamID'],
      );

  final int? id;

  final int? teamID;

  Map<String, dynamic> toJson() => {
        'id': id,
        'teamID': teamID,
      };
}

class GameMinAggregateOutputType {
  const GameMinAggregateOutputType({
    this.id,
    this.title,
    this.date,
    this.semester,
    this.teamID,
  });

  factory GameMinAggregateOutputType.fromJson(Map json) =>
      GameMinAggregateOutputType(
        id: json['id'],
        title: json['title'],
        date: switch (json['date']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['date']
        },
        semester: json['semester'],
        teamID: json['teamID'],
      );

  final int? id;

  final String? title;

  final DateTime? date;

  final String? semester;

  final int? teamID;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date?.toIso8601String(),
        'semester': semester,
        'teamID': teamID,
      };
}

class GameMaxAggregateOutputType {
  const GameMaxAggregateOutputType({
    this.id,
    this.title,
    this.date,
    this.semester,
    this.teamID,
  });

  factory GameMaxAggregateOutputType.fromJson(Map json) =>
      GameMaxAggregateOutputType(
        id: json['id'],
        title: json['title'],
        date: switch (json['date']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['date']
        },
        semester: json['semester'],
        teamID: json['teamID'],
      );

  final int? id;

  final String? title;

  final DateTime? date;

  final String? semester;

  final int? teamID;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date?.toIso8601String(),
        'semester': semester,
        'teamID': teamID,
      };
}

class GameGroupByOutputType {
  const GameGroupByOutputType({
    this.id,
    this.title,
    this.date,
    this.semester,
    this.teamID,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory GameGroupByOutputType.fromJson(Map json) => GameGroupByOutputType(
        id: json['id'],
        title: json['title'],
        date: switch (json['date']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['date']
        },
        semester: json['semester'],
        teamID: json['teamID'],
        $count: json['_count'] is Map
            ? _i2.GameCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.GameAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.GameSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.GameMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.GameMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final int? id;

  final String? title;

  final DateTime? date;

  final String? semester;

  final int? teamID;

  final _i2.GameCountAggregateOutputType? $count;

  final _i2.GameAvgAggregateOutputType? $avg;

  final _i2.GameSumAggregateOutputType? $sum;

  final _i2.GameMinAggregateOutputType? $min;

  final _i2.GameMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date?.toIso8601String(),
        'semester': semester,
        'teamID': teamID,
        '_count': $count?.toJson(),
        '_avg': $avg?.toJson(),
        '_sum': $sum?.toJson(),
        '_min': $min?.toJson(),
        '_max': $max?.toJson(),
      };
}

class GameCountOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameCountOrderByAggregateInput({
    this.id,
    this.title,
    this.date,
    this.semester,
    this.teamID,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? title;

  final _i2.SortOrder? date;

  final _i2.SortOrder? semester;

  final _i2.SortOrder? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
        'teamID': teamID,
      };
}

class GameAvgOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameAvgOrderByAggregateInput({
    this.id,
    this.teamID,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'teamID': teamID,
      };
}

class GameMaxOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameMaxOrderByAggregateInput({
    this.id,
    this.title,
    this.date,
    this.semester,
    this.teamID,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? title;

  final _i2.SortOrder? date;

  final _i2.SortOrder? semester;

  final _i2.SortOrder? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
        'teamID': teamID,
      };
}

class GameMinOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameMinOrderByAggregateInput({
    this.id,
    this.title,
    this.date,
    this.semester,
    this.teamID,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? title;

  final _i2.SortOrder? date;

  final _i2.SortOrder? semester;

  final _i2.SortOrder? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
        'teamID': teamID,
      };
}

class GameSumOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameSumOrderByAggregateInput({
    this.id,
    this.teamID,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'teamID': teamID,
      };
}

class GameOrderByWithAggregationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameOrderByWithAggregationInput({
    this.id,
    this.title,
    this.date,
    this.semester,
    this.teamID,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? title;

  final _i2.SortOrder? date;

  final _i2.SortOrder? semester;

  final _i2.SortOrder? teamID;

  final _i2.GameCountOrderByAggregateInput? $count;

  final _i2.GameAvgOrderByAggregateInput? $avg;

  final _i2.GameMaxOrderByAggregateInput? $max;

  final _i2.GameMinOrderByAggregateInput? $min;

  final _i2.GameSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
        'teamID': teamID,
        '_count': $count,
        '_avg': $avg,
        '_max': $max,
        '_min': $min,
        '_sum': $sum,
      };
}

class NestedStringWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedStringWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<String, _i1.Reference<String>>? equals;

  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<String, _i2.NestedStringWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedStringFilter? $min;

  final _i2.NestedStringFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'not': not,
        '_count': $count,
        '_min': $min,
        '_max': $max,
      };
}

class StringWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<String, _i1.Reference<String>>? equals;

  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<String, _i2.NestedStringWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedStringFilter? $min;

  final _i2.NestedStringFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'not': not,
        '_count': $count,
        '_min': $min,
        '_max': $max,
      };
}

class NestedDateTimeWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedDateTimeWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? equals;

  final Iterable<DateTime>? $in;

  final Iterable<DateTime>? notIn;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lte;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gte;

  final _i1.PrismaUnion<DateTime, _i2.NestedDateTimeWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedDateTimeFilter? $min;

  final _i2.NestedDateTimeFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'not': not,
        '_count': $count,
        '_min': $min,
        '_max': $max,
      };
}

class DateTimeWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const DateTimeWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? equals;

  final Iterable<DateTime>? $in;

  final Iterable<DateTime>? notIn;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? lte;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gt;

  final _i1.PrismaUnion<DateTime, _i1.Reference<DateTime>>? gte;

  final _i1.PrismaUnion<DateTime, _i2.NestedDateTimeWithAggregatesFilter>? not;

  final _i2.NestedIntFilter? $count;

  final _i2.NestedDateTimeFilter? $min;

  final _i2.NestedDateTimeFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'not': not,
        '_count': $count,
        '_min': $min,
        '_max': $max,
      };
}

class GameScalarWhereWithAggregatesInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.title,
    this.date,
    this.semester,
    this.teamID,
  });

  final _i1.PrismaUnion<_i2.GameScalarWhereWithAggregatesInput,
      Iterable<_i2.GameScalarWhereWithAggregatesInput>>? AND;

  final Iterable<_i2.GameScalarWhereWithAggregatesInput>? OR;

  final _i1.PrismaUnion<_i2.GameScalarWhereWithAggregatesInput,
      Iterable<_i2.GameScalarWhereWithAggregatesInput>>? NOT;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? title;

  final _i1.PrismaUnion<_i2.DateTimeWithAggregatesFilter, DateTime>? date;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? semester;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
        'teamID': teamID,
      };
}

class GameCountAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameCountAggregateOutputTypeSelect({
    this.id,
    this.title,
    this.date,
    this.semester,
    this.teamID,
    this.$all,
  });

  final bool? id;

  final bool? title;

  final bool? date;

  final bool? semester;

  final bool? teamID;

  final bool? $all;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
        'teamID': teamID,
        '_all': $all,
      };
}

class GameGroupByOutputTypeCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameGroupByOutputTypeCountArgs({this.select});

  final _i2.GameCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class GameAvgAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameAvgAggregateOutputTypeSelect({
    this.id,
    this.teamID,
  });

  final bool? id;

  final bool? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'teamID': teamID,
      };
}

class GameGroupByOutputTypeAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameGroupByOutputTypeAvgArgs({this.select});

  final _i2.GameAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class GameSumAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameSumAggregateOutputTypeSelect({
    this.id,
    this.teamID,
  });

  final bool? id;

  final bool? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'teamID': teamID,
      };
}

class GameGroupByOutputTypeSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameGroupByOutputTypeSumArgs({this.select});

  final _i2.GameSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class GameMinAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameMinAggregateOutputTypeSelect({
    this.id,
    this.title,
    this.date,
    this.semester,
    this.teamID,
  });

  final bool? id;

  final bool? title;

  final bool? date;

  final bool? semester;

  final bool? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
        'teamID': teamID,
      };
}

class GameGroupByOutputTypeMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameGroupByOutputTypeMinArgs({this.select});

  final _i2.GameMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class GameMaxAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameMaxAggregateOutputTypeSelect({
    this.id,
    this.title,
    this.date,
    this.semester,
    this.teamID,
  });

  final bool? id;

  final bool? title;

  final bool? date;

  final bool? semester;

  final bool? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
        'teamID': teamID,
      };
}

class GameGroupByOutputTypeMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameGroupByOutputTypeMaxArgs({this.select});

  final _i2.GameMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class GameGroupByOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameGroupByOutputTypeSelect({
    this.id,
    this.title,
    this.date,
    this.semester,
    this.teamID,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final bool? id;

  final bool? title;

  final bool? date;

  final bool? semester;

  final bool? teamID;

  final _i1.PrismaUnion<bool, _i2.GameGroupByOutputTypeCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.GameGroupByOutputTypeAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.GameGroupByOutputTypeSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.GameGroupByOutputTypeMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.GameGroupByOutputTypeMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
        'teamID': teamID,
        '_count': $count,
        '_avg': $avg,
        '_sum': $sum,
        '_min': $min,
        '_max': $max,
      };
}

class AggregateGame {
  const AggregateGame({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory AggregateGame.fromJson(Map json) => AggregateGame(
        $count: json['_count'] is Map
            ? _i2.GameCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.GameAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.GameSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.GameMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.GameMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final _i2.GameCountAggregateOutputType? $count;

  final _i2.GameAvgAggregateOutputType? $avg;

  final _i2.GameSumAggregateOutputType? $sum;

  final _i2.GameMinAggregateOutputType? $min;

  final _i2.GameMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
        '_count': $count?.toJson(),
        '_avg': $avg?.toJson(),
        '_sum': $sum?.toJson(),
        '_min': $min?.toJson(),
        '_max': $max?.toJson(),
      };
}

class AggregateGameCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateGameCountArgs({this.select});

  final _i2.GameCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateGameAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateGameAvgArgs({this.select});

  final _i2.GameAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateGameSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateGameSumArgs({this.select});

  final _i2.GameSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateGameMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateGameMinArgs({this.select});

  final _i2.GameMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateGameMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateGameMaxArgs({this.select});

  final _i2.GameMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateGameSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateGameSelect({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i2.AggregateGameCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AggregateGameAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.AggregateGameSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.AggregateGameMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AggregateGameMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
        '_count': $count,
        '_avg': $avg,
        '_sum': $sum,
        '_min': $min,
        '_max': $max,
      };
}

class QuarterCountOutputType {
  const QuarterCountOutputType({this.logs});

  factory QuarterCountOutputType.fromJson(Map json) =>
      QuarterCountOutputType(logs: json['Logs']);

  final int? logs;

  Map<String, dynamic> toJson() => {'Logs': logs};
}

class NestedStringNullableFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedStringNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
  });

  final _i1.PrismaUnion<String,
      _i1.PrismaUnion<_i1.Reference<String>, _i1.PrismaNull>>? equals;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? $in;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<String,
      _i1.PrismaUnion<_i2.NestedStringNullableFilter, _i1.PrismaNull>>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'not': not,
      };
}

class StringNullableFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
  });

  final _i1.PrismaUnion<String,
      _i1.PrismaUnion<_i1.Reference<String>, _i1.PrismaNull>>? equals;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? $in;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<String,
      _i1.PrismaUnion<_i2.NestedStringNullableFilter, _i1.PrismaNull>>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'not': not,
      };
}

class QuarterRelationFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterRelationFilter({
    this.$is,
    this.isNot,
  });

  final _i2.QuarterWhereInput? $is;

  final _i2.QuarterWhereInput? isNot;

  @override
  Map<String, dynamic> toJson() => {
        'is': $is,
        'isNot': isNot,
      };
}

class LogsWhereInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
    this.quarterID,
    this.quarter,
  });

  final _i1.PrismaUnion<_i2.LogsWhereInput, Iterable<_i2.LogsWhereInput>>? AND;

  final Iterable<_i2.LogsWhereInput>? OR;

  final _i1.PrismaUnion<_i2.LogsWhereInput, Iterable<_i2.LogsWhereInput>>? NOT;

  final _i1.PrismaUnion<_i2.IntFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? keywordOne;

  final _i1.PrismaUnion<_i2.StringFilter, String>? keywordTwo;

  final _i1.PrismaUnion<_i2.StringNullableFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? keywordThree;

  final _i1.PrismaUnion<_i2.DateTimeFilter, DateTime>? timestamp;

  final _i1.PrismaUnion<_i2.IntFilter, int>? quarterID;

  final _i1.PrismaUnion<_i2.QuarterRelationFilter, _i2.QuarterWhereInput>?
      quarter;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
        'quarterID': quarterID,
        'quarter': quarter,
      };
}

class LogsListRelationFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsListRelationFilter({
    this.every,
    this.some,
    this.none,
  });

  final _i2.LogsWhereInput? every;

  final _i2.LogsWhereInput? some;

  final _i2.LogsWhereInput? none;

  @override
  Map<String, dynamic> toJson() => {
        'every': every,
        'some': some,
        'none': none,
      };
}

class QuarterWhereInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterWhereInput({
    this.AND,
    this.OR,
    this.NOT,
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
    this.logs,
  });

  final _i1.PrismaUnion<_i2.QuarterWhereInput, Iterable<_i2.QuarterWhereInput>>?
      AND;

  final Iterable<_i2.QuarterWhereInput>? OR;

  final _i1.PrismaUnion<_i2.QuarterWhereInput, Iterable<_i2.QuarterWhereInput>>?
      NOT;

  final _i1.PrismaUnion<_i2.IntFilter, int>? id;

  final _i1.PrismaUnion<_i2.IntFilter, int>? number;

  final _i1.PrismaUnion<_i2.IntFilter, int>? totalScore;

  final _i1.PrismaUnion<_i2.IntFilter, int>? madeOne;

  final _i1.PrismaUnion<_i2.IntFilter, int>? madeTwo;

  final _i1.PrismaUnion<_i2.IntFilter, int>? madeThree;

  final _i1.PrismaUnion<_i2.IntFilter, int>? miss;

  final _i1.PrismaUnion<_i2.IntFilter, int>? reboundOffensive;

  final _i1.PrismaUnion<_i2.IntFilter, int>? reboundDefensive;

  final _i1.PrismaUnion<_i2.IntFilter, int>? foul;

  final _i1.PrismaUnion<_i2.IntFilter, int>? turnover;

  final _i1.PrismaUnion<_i2.IntFilter, int>? assist;

  final _i1.PrismaUnion<_i2.IntFilter, int>? block;

  final _i1.PrismaUnion<_i2.IntFilter, int>? steal;

  final _i2.LogsListRelationFilter? logs;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
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
        'Logs': logs,
      };
}

class QuarterWhereUniqueInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterWhereUniqueInput({
    this.id,
    this.AND,
    this.OR,
    this.NOT,
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
    this.logs,
  });

  final int? id;

  final _i1.PrismaUnion<_i2.QuarterWhereInput, Iterable<_i2.QuarterWhereInput>>?
      AND;

  final Iterable<_i2.QuarterWhereInput>? OR;

  final _i1.PrismaUnion<_i2.QuarterWhereInput, Iterable<_i2.QuarterWhereInput>>?
      NOT;

  final _i1.PrismaUnion<_i2.IntFilter, int>? number;

  final _i1.PrismaUnion<_i2.IntFilter, int>? totalScore;

  final _i1.PrismaUnion<_i2.IntFilter, int>? madeOne;

  final _i1.PrismaUnion<_i2.IntFilter, int>? madeTwo;

  final _i1.PrismaUnion<_i2.IntFilter, int>? madeThree;

  final _i1.PrismaUnion<_i2.IntFilter, int>? miss;

  final _i1.PrismaUnion<_i2.IntFilter, int>? reboundOffensive;

  final _i1.PrismaUnion<_i2.IntFilter, int>? reboundDefensive;

  final _i1.PrismaUnion<_i2.IntFilter, int>? foul;

  final _i1.PrismaUnion<_i2.IntFilter, int>? turnover;

  final _i1.PrismaUnion<_i2.IntFilter, int>? assist;

  final _i1.PrismaUnion<_i2.IntFilter, int>? block;

  final _i1.PrismaUnion<_i2.IntFilter, int>? steal;

  final _i2.LogsListRelationFilter? logs;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
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
        'Logs': logs,
      };
}

class LogsQuarterArgs implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsQuarterArgs({
    this.select,
    this.include,
  });

  final _i2.QuarterSelect? select;

  final _i2.QuarterInclude? include;

  @override
  Map<String, dynamic> toJson() => {
        'select': select,
        'include': include,
      };
}

class LogsInclude implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsInclude({this.quarter});

  final _i1.PrismaUnion<bool, _i2.LogsQuarterArgs>? quarter;

  @override
  Map<String, dynamic> toJson() => {'quarter': quarter};
}

enum NullsOrder implements _i1.PrismaEnum {
  first._('first'),
  last._('last');

  const NullsOrder._(this.name);

  @override
  final String name;
}

class SortOrderInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const SortOrderInput({
    required this.sort,
    this.nulls,
  });

  final _i2.SortOrder sort;

  final _i2.NullsOrder? nulls;

  @override
  Map<String, dynamic> toJson() => {
        'sort': sort,
        'nulls': nulls,
      };
}

class LogsOrderByRelationAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsOrderByRelationAggregateInput({this.$count});

  final _i2.SortOrder? $count;

  @override
  Map<String, dynamic> toJson() => {'_count': $count};
}

class QuarterOrderByWithRelationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterOrderByWithRelationInput({
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
    this.logs,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? number;

  final _i2.SortOrder? totalScore;

  final _i2.SortOrder? madeOne;

  final _i2.SortOrder? madeTwo;

  final _i2.SortOrder? madeThree;

  final _i2.SortOrder? miss;

  final _i2.SortOrder? reboundOffensive;

  final _i2.SortOrder? reboundDefensive;

  final _i2.SortOrder? foul;

  final _i2.SortOrder? turnover;

  final _i2.SortOrder? assist;

  final _i2.SortOrder? block;

  final _i2.SortOrder? steal;

  final _i2.LogsOrderByRelationAggregateInput? logs;

  @override
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
        'Logs': logs,
      };
}

class LogsOrderByWithRelationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsOrderByWithRelationInput({
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
    this.quarterID,
    this.quarter,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? keywordOne;

  final _i2.SortOrder? keywordTwo;

  final _i1.PrismaUnion<_i2.SortOrder, _i2.SortOrderInput>? keywordThree;

  final _i2.SortOrder? timestamp;

  final _i2.SortOrder? quarterID;

  final _i2.QuarterOrderByWithRelationInput? quarter;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
        'quarterID': quarterID,
        'quarter': quarter,
      };
}

class LogsWhereUniqueInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsWhereUniqueInput({
    this.id,
    this.AND,
    this.OR,
    this.NOT,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
    this.quarterID,
    this.quarter,
  });

  final int? id;

  final _i1.PrismaUnion<_i2.LogsWhereInput, Iterable<_i2.LogsWhereInput>>? AND;

  final Iterable<_i2.LogsWhereInput>? OR;

  final _i1.PrismaUnion<_i2.LogsWhereInput, Iterable<_i2.LogsWhereInput>>? NOT;

  final _i1.PrismaUnion<_i2.StringFilter, String>? keywordOne;

  final _i1.PrismaUnion<_i2.StringFilter, String>? keywordTwo;

  final _i1.PrismaUnion<_i2.StringNullableFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? keywordThree;

  final _i1.PrismaUnion<_i2.DateTimeFilter, DateTime>? timestamp;

  final _i1.PrismaUnion<_i2.IntFilter, int>? quarterID;

  final _i1.PrismaUnion<_i2.QuarterRelationFilter, _i2.QuarterWhereInput>?
      quarter;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
        'quarterID': quarterID,
        'quarter': quarter,
      };
}

enum LogsScalar<T> implements _i1.PrismaEnum, _i1.Reference<T> {
  id<int>('id', 'Logs'),
  keywordOne<String>('keywordOne', 'Logs'),
  keywordTwo<String>('keywordTwo', 'Logs'),
  keywordThree<String>('keywordThree', 'Logs'),
  timestamp<DateTime>('timestamp', 'Logs'),
  quarterID<int>('quarterID', 'Logs');

  const LogsScalar(
    this.name,
    this.model,
  );

  @override
  final String name;

  @override
  final String model;
}

class QuarterLogsArgs implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterLogsArgs({
    this.where,
    this.orderBy,
    this.cursor,
    this.take,
    this.skip,
    this.distinct,
    this.select,
    this.include,
  });

  final _i2.LogsWhereInput? where;

  final _i1.PrismaUnion<Iterable<_i2.LogsOrderByWithRelationInput>,
      _i2.LogsOrderByWithRelationInput>? orderBy;

  final _i2.LogsWhereUniqueInput? cursor;

  final int? take;

  final int? skip;

  final _i1.PrismaUnion<_i2.LogsScalar, Iterable<_i2.LogsScalar>>? distinct;

  final _i2.LogsSelect? select;

  final _i2.LogsInclude? include;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'orderBy': orderBy,
        'cursor': cursor,
        'take': take,
        'skip': skip,
        'distinct': distinct,
        'select': select,
        'include': include,
      };
}

class QuarterCountOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterCountOutputTypeSelect({this.logs});

  final bool? logs;

  @override
  Map<String, dynamic> toJson() => {'Logs': logs};
}

class QuarterCountArgs implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterCountArgs({this.select});

  final _i2.QuarterCountOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class QuarterInclude implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterInclude({
    this.logs,
    this.$count,
  });

  final _i1.PrismaUnion<bool, _i2.QuarterLogsArgs>? logs;

  final _i1.PrismaUnion<bool, _i2.QuarterCountArgs>? $count;

  @override
  Map<String, dynamic> toJson() => {
        'Logs': logs,
        '_count': $count,
      };
}

class LogsSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsSelect({
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
    this.quarterID,
    this.quarter,
  });

  final bool? id;

  final bool? keywordOne;

  final bool? keywordTwo;

  final bool? keywordThree;

  final bool? timestamp;

  final bool? quarterID;

  final _i1.PrismaUnion<bool, _i2.LogsQuarterArgs>? quarter;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
        'quarterID': quarterID,
        'quarter': quarter,
      };
}

class QuarterSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterSelect({
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
    this.logs,
    this.$count,
  });

  final bool? id;

  final bool? number;

  final bool? totalScore;

  final bool? madeOne;

  final bool? madeTwo;

  final bool? madeThree;

  final bool? miss;

  final bool? reboundOffensive;

  final bool? reboundDefensive;

  final bool? foul;

  final bool? turnover;

  final bool? assist;

  final bool? block;

  final bool? steal;

  final _i1.PrismaUnion<bool, _i2.QuarterLogsArgs>? logs;

  final _i1.PrismaUnion<bool, _i2.QuarterCountArgs>? $count;

  @override
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
        'Logs': logs,
        '_count': $count,
      };
}

enum QuarterScalar<T> implements _i1.PrismaEnum, _i1.Reference<T> {
  id<int>('id', 'Quarter'),
  number<int>('number', 'Quarter'),
  totalScore<int>('totalScore', 'Quarter'),
  madeOne<int>('madeOne', 'Quarter'),
  madeTwo<int>('madeTwo', 'Quarter'),
  madeThree<int>('madeThree', 'Quarter'),
  miss<int>('miss', 'Quarter'),
  reboundOffensive<int>('reboundOffensive', 'Quarter'),
  reboundDefensive<int>('reboundDefensive', 'Quarter'),
  foul<int>('foul', 'Quarter'),
  turnover<int>('turnover', 'Quarter'),
  assist<int>('assist', 'Quarter'),
  block<int>('block', 'Quarter'),
  steal<int>('steal', 'Quarter');

  const QuarterScalar(
    this.name,
    this.model,
  );

  @override
  final String name;

  @override
  final String model;
}

class LogsCreateWithoutQuarterInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsCreateWithoutQuarterInput({
    required this.keywordOne,
    required this.keywordTwo,
    this.keywordThree,
    required this.timestamp,
  });

  final String keywordOne;

  final String keywordTwo;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? keywordThree;

  final DateTime timestamp;

  @override
  Map<String, dynamic> toJson() => {
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
      };
}

class LogsUncheckedCreateWithoutQuarterInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsUncheckedCreateWithoutQuarterInput({
    this.id,
    required this.keywordOne,
    required this.keywordTwo,
    this.keywordThree,
    required this.timestamp,
  });

  final int? id;

  final String keywordOne;

  final String keywordTwo;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? keywordThree;

  final DateTime timestamp;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
      };
}

class LogsCreateOrConnectWithoutQuarterInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsCreateOrConnectWithoutQuarterInput({
    required this.where,
    required this.create,
  });

  final _i2.LogsWhereUniqueInput where;

  final _i1.PrismaUnion<_i2.LogsCreateWithoutQuarterInput,
      _i2.LogsUncheckedCreateWithoutQuarterInput> create;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'create': create,
      };
}

class LogsCreateManyQuarterInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsCreateManyQuarterInput({
    this.id,
    required this.keywordOne,
    required this.keywordTwo,
    this.keywordThree,
    required this.timestamp,
  });

  final int? id;

  final String keywordOne;

  final String keywordTwo;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? keywordThree;

  final DateTime timestamp;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
      };
}

class LogsCreateManyQuarterInputEnvelope
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsCreateManyQuarterInputEnvelope({required this.data});

  final _i1.PrismaUnion<_i2.LogsCreateManyQuarterInput,
      Iterable<_i2.LogsCreateManyQuarterInput>> data;

  @override
  Map<String, dynamic> toJson() => {'data': data};
}

class LogsCreateNestedManyWithoutQuarterInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsCreateNestedManyWithoutQuarterInput({
    this.create,
    this.connectOrCreate,
    this.createMany,
    this.connect,
  });

  final _i1.PrismaUnion<
      _i2.LogsCreateWithoutQuarterInput,
      _i1.PrismaUnion<
          Iterable<_i2.LogsCreateWithoutQuarterInput>,
          _i1.PrismaUnion<_i2.LogsUncheckedCreateWithoutQuarterInput,
              Iterable<_i2.LogsUncheckedCreateWithoutQuarterInput>>>>? create;

  final _i1.PrismaUnion<_i2.LogsCreateOrConnectWithoutQuarterInput,
      Iterable<_i2.LogsCreateOrConnectWithoutQuarterInput>>? connectOrCreate;

  final _i2.LogsCreateManyQuarterInputEnvelope? createMany;

  final _i1.PrismaUnion<_i2.LogsWhereUniqueInput,
      Iterable<_i2.LogsWhereUniqueInput>>? connect;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'createMany': createMany,
        'connect': connect,
      };
}

class QuarterCreateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterCreateInput({
    required this.number,
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
    this.logs,
  });

  final int number;

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

  final _i2.LogsCreateNestedManyWithoutQuarterInput? logs;

  @override
  Map<String, dynamic> toJson() => {
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
        'Logs': logs,
      };
}

class LogsUncheckedCreateNestedManyWithoutQuarterInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsUncheckedCreateNestedManyWithoutQuarterInput({
    this.create,
    this.connectOrCreate,
    this.createMany,
    this.connect,
  });

  final _i1.PrismaUnion<
      _i2.LogsCreateWithoutQuarterInput,
      _i1.PrismaUnion<
          Iterable<_i2.LogsCreateWithoutQuarterInput>,
          _i1.PrismaUnion<_i2.LogsUncheckedCreateWithoutQuarterInput,
              Iterable<_i2.LogsUncheckedCreateWithoutQuarterInput>>>>? create;

  final _i1.PrismaUnion<_i2.LogsCreateOrConnectWithoutQuarterInput,
      Iterable<_i2.LogsCreateOrConnectWithoutQuarterInput>>? connectOrCreate;

  final _i2.LogsCreateManyQuarterInputEnvelope? createMany;

  final _i1.PrismaUnion<_i2.LogsWhereUniqueInput,
      Iterable<_i2.LogsWhereUniqueInput>>? connect;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'createMany': createMany,
        'connect': connect,
      };
}

class QuarterUncheckedCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterUncheckedCreateInput({
    this.id,
    required this.number,
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
    this.logs,
  });

  final int? id;

  final int number;

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

  final _i2.LogsUncheckedCreateNestedManyWithoutQuarterInput? logs;

  @override
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
        'Logs': logs,
      };
}

class QuarterCreateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterCreateManyInput({
    this.id,
    required this.number,
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

  final int? id;

  final int number;

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

  @override
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

class CreateManyQuarterAndReturnOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const CreateManyQuarterAndReturnOutputTypeSelect({
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

  final bool? id;

  final bool? number;

  final bool? totalScore;

  final bool? madeOne;

  final bool? madeTwo;

  final bool? madeThree;

  final bool? miss;

  final bool? reboundOffensive;

  final bool? reboundDefensive;

  final bool? foul;

  final bool? turnover;

  final bool? assist;

  final bool? block;

  final bool? steal;

  @override
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

class NullableStringFieldUpdateOperationsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NullableStringFieldUpdateOperationsInput({this.set});

  final _i1.PrismaUnion<String, _i1.PrismaNull>? set;

  @override
  Map<String, dynamic> toJson() => {'set': set};
}

class LogsUpdateWithoutQuarterInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsUpdateWithoutQuarterInput({
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      keywordOne;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      keywordTwo;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? keywordThree;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      timestamp;

  @override
  Map<String, dynamic> toJson() => {
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
      };
}

class LogsUncheckedUpdateWithoutQuarterInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsUncheckedUpdateWithoutQuarterInput({
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      keywordOne;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      keywordTwo;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? keywordThree;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      timestamp;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
      };
}

class LogsUpsertWithWhereUniqueWithoutQuarterInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsUpsertWithWhereUniqueWithoutQuarterInput({
    required this.where,
    required this.update,
    required this.create,
  });

  final _i2.LogsWhereUniqueInput where;

  final _i1.PrismaUnion<_i2.LogsUpdateWithoutQuarterInput,
      _i2.LogsUncheckedUpdateWithoutQuarterInput> update;

  final _i1.PrismaUnion<_i2.LogsCreateWithoutQuarterInput,
      _i2.LogsUncheckedCreateWithoutQuarterInput> create;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'update': update,
        'create': create,
      };
}

class LogsUpdateWithWhereUniqueWithoutQuarterInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsUpdateWithWhereUniqueWithoutQuarterInput({
    required this.where,
    required this.data,
  });

  final _i2.LogsWhereUniqueInput where;

  final _i1.PrismaUnion<_i2.LogsUpdateWithoutQuarterInput,
      _i2.LogsUncheckedUpdateWithoutQuarterInput> data;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'data': data,
      };
}

class LogsScalarWhereInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsScalarWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
    this.quarterID,
  });

  final _i1.PrismaUnion<_i2.LogsScalarWhereInput,
      Iterable<_i2.LogsScalarWhereInput>>? AND;

  final Iterable<_i2.LogsScalarWhereInput>? OR;

  final _i1.PrismaUnion<_i2.LogsScalarWhereInput,
      Iterable<_i2.LogsScalarWhereInput>>? NOT;

  final _i1.PrismaUnion<_i2.IntFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? keywordOne;

  final _i1.PrismaUnion<_i2.StringFilter, String>? keywordTwo;

  final _i1.PrismaUnion<_i2.StringNullableFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? keywordThree;

  final _i1.PrismaUnion<_i2.DateTimeFilter, DateTime>? timestamp;

  final _i1.PrismaUnion<_i2.IntFilter, int>? quarterID;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
        'quarterID': quarterID,
      };
}

class LogsUpdateManyMutationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsUpdateManyMutationInput({
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      keywordOne;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      keywordTwo;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? keywordThree;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      timestamp;

  @override
  Map<String, dynamic> toJson() => {
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
      };
}

class LogsUncheckedUpdateManyWithoutQuarterInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsUncheckedUpdateManyWithoutQuarterInput({
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      keywordOne;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      keywordTwo;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? keywordThree;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      timestamp;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
      };
}

class LogsUpdateManyWithWhereWithoutQuarterInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsUpdateManyWithWhereWithoutQuarterInput({
    required this.where,
    required this.data,
  });

  final _i2.LogsScalarWhereInput where;

  final _i1.PrismaUnion<_i2.LogsUpdateManyMutationInput,
      _i2.LogsUncheckedUpdateManyWithoutQuarterInput> data;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'data': data,
      };
}

class LogsUpdateManyWithoutQuarterNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsUpdateManyWithoutQuarterNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.createMany,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  final _i1.PrismaUnion<
      _i2.LogsCreateWithoutQuarterInput,
      _i1.PrismaUnion<
          Iterable<_i2.LogsCreateWithoutQuarterInput>,
          _i1.PrismaUnion<_i2.LogsUncheckedCreateWithoutQuarterInput,
              Iterable<_i2.LogsUncheckedCreateWithoutQuarterInput>>>>? create;

  final _i1.PrismaUnion<_i2.LogsCreateOrConnectWithoutQuarterInput,
      Iterable<_i2.LogsCreateOrConnectWithoutQuarterInput>>? connectOrCreate;

  final _i1.PrismaUnion<_i2.LogsUpsertWithWhereUniqueWithoutQuarterInput,
      Iterable<_i2.LogsUpsertWithWhereUniqueWithoutQuarterInput>>? upsert;

  final _i2.LogsCreateManyQuarterInputEnvelope? createMany;

  final _i1.PrismaUnion<_i2.LogsWhereUniqueInput,
      Iterable<_i2.LogsWhereUniqueInput>>? set;

  final _i1.PrismaUnion<_i2.LogsWhereUniqueInput,
      Iterable<_i2.LogsWhereUniqueInput>>? disconnect;

  final _i1.PrismaUnion<_i2.LogsWhereUniqueInput,
      Iterable<_i2.LogsWhereUniqueInput>>? delete;

  final _i1.PrismaUnion<_i2.LogsWhereUniqueInput,
      Iterable<_i2.LogsWhereUniqueInput>>? connect;

  final _i1.PrismaUnion<_i2.LogsUpdateWithWhereUniqueWithoutQuarterInput,
      Iterable<_i2.LogsUpdateWithWhereUniqueWithoutQuarterInput>>? update;

  final _i1.PrismaUnion<_i2.LogsUpdateManyWithWhereWithoutQuarterInput,
      Iterable<_i2.LogsUpdateManyWithWhereWithoutQuarterInput>>? updateMany;

  final _i1.PrismaUnion<_i2.LogsScalarWhereInput,
      Iterable<_i2.LogsScalarWhereInput>>? deleteMany;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'upsert': upsert,
        'createMany': createMany,
        'set': set,
        'disconnect': disconnect,
        'delete': delete,
        'connect': connect,
        'update': update,
        'updateMany': updateMany,
        'deleteMany': deleteMany,
      };
}

class QuarterUpdateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterUpdateInput({
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
    this.logs,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? number;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? totalScore;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? madeOne;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? madeTwo;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? madeThree;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? miss;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>?
      reboundOffensive;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>?
      reboundDefensive;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? foul;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? turnover;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? assist;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? block;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? steal;

  final _i2.LogsUpdateManyWithoutQuarterNestedInput? logs;

  @override
  Map<String, dynamic> toJson() => {
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
        'Logs': logs,
      };
}

class LogsUncheckedUpdateManyWithoutQuarterNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsUncheckedUpdateManyWithoutQuarterNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.createMany,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  final _i1.PrismaUnion<
      _i2.LogsCreateWithoutQuarterInput,
      _i1.PrismaUnion<
          Iterable<_i2.LogsCreateWithoutQuarterInput>,
          _i1.PrismaUnion<_i2.LogsUncheckedCreateWithoutQuarterInput,
              Iterable<_i2.LogsUncheckedCreateWithoutQuarterInput>>>>? create;

  final _i1.PrismaUnion<_i2.LogsCreateOrConnectWithoutQuarterInput,
      Iterable<_i2.LogsCreateOrConnectWithoutQuarterInput>>? connectOrCreate;

  final _i1.PrismaUnion<_i2.LogsUpsertWithWhereUniqueWithoutQuarterInput,
      Iterable<_i2.LogsUpsertWithWhereUniqueWithoutQuarterInput>>? upsert;

  final _i2.LogsCreateManyQuarterInputEnvelope? createMany;

  final _i1.PrismaUnion<_i2.LogsWhereUniqueInput,
      Iterable<_i2.LogsWhereUniqueInput>>? set;

  final _i1.PrismaUnion<_i2.LogsWhereUniqueInput,
      Iterable<_i2.LogsWhereUniqueInput>>? disconnect;

  final _i1.PrismaUnion<_i2.LogsWhereUniqueInput,
      Iterable<_i2.LogsWhereUniqueInput>>? delete;

  final _i1.PrismaUnion<_i2.LogsWhereUniqueInput,
      Iterable<_i2.LogsWhereUniqueInput>>? connect;

  final _i1.PrismaUnion<_i2.LogsUpdateWithWhereUniqueWithoutQuarterInput,
      Iterable<_i2.LogsUpdateWithWhereUniqueWithoutQuarterInput>>? update;

  final _i1.PrismaUnion<_i2.LogsUpdateManyWithWhereWithoutQuarterInput,
      Iterable<_i2.LogsUpdateManyWithWhereWithoutQuarterInput>>? updateMany;

  final _i1.PrismaUnion<_i2.LogsScalarWhereInput,
      Iterable<_i2.LogsScalarWhereInput>>? deleteMany;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'upsert': upsert,
        'createMany': createMany,
        'set': set,
        'disconnect': disconnect,
        'delete': delete,
        'connect': connect,
        'update': update,
        'updateMany': updateMany,
        'deleteMany': deleteMany,
      };
}

class QuarterUncheckedUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterUncheckedUpdateInput({
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
    this.logs,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? number;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? totalScore;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? madeOne;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? madeTwo;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? madeThree;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? miss;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>?
      reboundOffensive;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>?
      reboundDefensive;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? foul;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? turnover;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? assist;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? block;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? steal;

  final _i2.LogsUncheckedUpdateManyWithoutQuarterNestedInput? logs;

  @override
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
        'Logs': logs,
      };
}

class QuarterUpdateManyMutationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterUpdateManyMutationInput({
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

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? number;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? totalScore;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? madeOne;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? madeTwo;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? madeThree;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? miss;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>?
      reboundOffensive;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>?
      reboundDefensive;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? foul;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? turnover;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? assist;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? block;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? steal;

  @override
  Map<String, dynamic> toJson() => {
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

class QuarterUncheckedUpdateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterUncheckedUpdateManyInput({
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

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? number;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? totalScore;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? madeOne;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? madeTwo;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? madeThree;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? miss;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>?
      reboundOffensive;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>?
      reboundDefensive;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? foul;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? turnover;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? assist;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? block;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? steal;

  @override
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

class QuarterCountAggregateOutputType {
  const QuarterCountAggregateOutputType({
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
    this.$all,
  });

  factory QuarterCountAggregateOutputType.fromJson(Map json) =>
      QuarterCountAggregateOutputType(
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
        $all: json['_all'],
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

  final int? $all;

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
        '_all': $all,
      };
}

class QuarterAvgAggregateOutputType {
  const QuarterAvgAggregateOutputType({
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

  factory QuarterAvgAggregateOutputType.fromJson(Map json) =>
      QuarterAvgAggregateOutputType(
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

  final double? id;

  final double? number;

  final double? totalScore;

  final double? madeOne;

  final double? madeTwo;

  final double? madeThree;

  final double? miss;

  final double? reboundOffensive;

  final double? reboundDefensive;

  final double? foul;

  final double? turnover;

  final double? assist;

  final double? block;

  final double? steal;

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

class QuarterSumAggregateOutputType {
  const QuarterSumAggregateOutputType({
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

  factory QuarterSumAggregateOutputType.fromJson(Map json) =>
      QuarterSumAggregateOutputType(
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

class QuarterMinAggregateOutputType {
  const QuarterMinAggregateOutputType({
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

  factory QuarterMinAggregateOutputType.fromJson(Map json) =>
      QuarterMinAggregateOutputType(
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

class QuarterMaxAggregateOutputType {
  const QuarterMaxAggregateOutputType({
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

  factory QuarterMaxAggregateOutputType.fromJson(Map json) =>
      QuarterMaxAggregateOutputType(
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

class QuarterGroupByOutputType {
  const QuarterGroupByOutputType({
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
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory QuarterGroupByOutputType.fromJson(Map json) =>
      QuarterGroupByOutputType(
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
        $count: json['_count'] is Map
            ? _i2.QuarterCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.QuarterAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.QuarterSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.QuarterMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.QuarterMaxAggregateOutputType.fromJson(json['_max'])
            : null,
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

  final _i2.QuarterCountAggregateOutputType? $count;

  final _i2.QuarterAvgAggregateOutputType? $avg;

  final _i2.QuarterSumAggregateOutputType? $sum;

  final _i2.QuarterMinAggregateOutputType? $min;

  final _i2.QuarterMaxAggregateOutputType? $max;

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
        '_count': $count?.toJson(),
        '_avg': $avg?.toJson(),
        '_sum': $sum?.toJson(),
        '_min': $min?.toJson(),
        '_max': $max?.toJson(),
      };
}

class QuarterCountOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterCountOrderByAggregateInput({
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

  final _i2.SortOrder? id;

  final _i2.SortOrder? number;

  final _i2.SortOrder? totalScore;

  final _i2.SortOrder? madeOne;

  final _i2.SortOrder? madeTwo;

  final _i2.SortOrder? madeThree;

  final _i2.SortOrder? miss;

  final _i2.SortOrder? reboundOffensive;

  final _i2.SortOrder? reboundDefensive;

  final _i2.SortOrder? foul;

  final _i2.SortOrder? turnover;

  final _i2.SortOrder? assist;

  final _i2.SortOrder? block;

  final _i2.SortOrder? steal;

  @override
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

class QuarterAvgOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterAvgOrderByAggregateInput({
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

  final _i2.SortOrder? id;

  final _i2.SortOrder? number;

  final _i2.SortOrder? totalScore;

  final _i2.SortOrder? madeOne;

  final _i2.SortOrder? madeTwo;

  final _i2.SortOrder? madeThree;

  final _i2.SortOrder? miss;

  final _i2.SortOrder? reboundOffensive;

  final _i2.SortOrder? reboundDefensive;

  final _i2.SortOrder? foul;

  final _i2.SortOrder? turnover;

  final _i2.SortOrder? assist;

  final _i2.SortOrder? block;

  final _i2.SortOrder? steal;

  @override
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

class QuarterMaxOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterMaxOrderByAggregateInput({
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

  final _i2.SortOrder? id;

  final _i2.SortOrder? number;

  final _i2.SortOrder? totalScore;

  final _i2.SortOrder? madeOne;

  final _i2.SortOrder? madeTwo;

  final _i2.SortOrder? madeThree;

  final _i2.SortOrder? miss;

  final _i2.SortOrder? reboundOffensive;

  final _i2.SortOrder? reboundDefensive;

  final _i2.SortOrder? foul;

  final _i2.SortOrder? turnover;

  final _i2.SortOrder? assist;

  final _i2.SortOrder? block;

  final _i2.SortOrder? steal;

  @override
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

class QuarterMinOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterMinOrderByAggregateInput({
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

  final _i2.SortOrder? id;

  final _i2.SortOrder? number;

  final _i2.SortOrder? totalScore;

  final _i2.SortOrder? madeOne;

  final _i2.SortOrder? madeTwo;

  final _i2.SortOrder? madeThree;

  final _i2.SortOrder? miss;

  final _i2.SortOrder? reboundOffensive;

  final _i2.SortOrder? reboundDefensive;

  final _i2.SortOrder? foul;

  final _i2.SortOrder? turnover;

  final _i2.SortOrder? assist;

  final _i2.SortOrder? block;

  final _i2.SortOrder? steal;

  @override
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

class QuarterSumOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterSumOrderByAggregateInput({
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

  final _i2.SortOrder? id;

  final _i2.SortOrder? number;

  final _i2.SortOrder? totalScore;

  final _i2.SortOrder? madeOne;

  final _i2.SortOrder? madeTwo;

  final _i2.SortOrder? madeThree;

  final _i2.SortOrder? miss;

  final _i2.SortOrder? reboundOffensive;

  final _i2.SortOrder? reboundDefensive;

  final _i2.SortOrder? foul;

  final _i2.SortOrder? turnover;

  final _i2.SortOrder? assist;

  final _i2.SortOrder? block;

  final _i2.SortOrder? steal;

  @override
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

class QuarterOrderByWithAggregationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterOrderByWithAggregationInput({
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
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? number;

  final _i2.SortOrder? totalScore;

  final _i2.SortOrder? madeOne;

  final _i2.SortOrder? madeTwo;

  final _i2.SortOrder? madeThree;

  final _i2.SortOrder? miss;

  final _i2.SortOrder? reboundOffensive;

  final _i2.SortOrder? reboundDefensive;

  final _i2.SortOrder? foul;

  final _i2.SortOrder? turnover;

  final _i2.SortOrder? assist;

  final _i2.SortOrder? block;

  final _i2.SortOrder? steal;

  final _i2.QuarterCountOrderByAggregateInput? $count;

  final _i2.QuarterAvgOrderByAggregateInput? $avg;

  final _i2.QuarterMaxOrderByAggregateInput? $max;

  final _i2.QuarterMinOrderByAggregateInput? $min;

  final _i2.QuarterSumOrderByAggregateInput? $sum;

  @override
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
        '_count': $count,
        '_avg': $avg,
        '_max': $max,
        '_min': $min,
        '_sum': $sum,
      };
}

class QuarterScalarWhereWithAggregatesInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
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

  final _i1.PrismaUnion<_i2.QuarterScalarWhereWithAggregatesInput,
      Iterable<_i2.QuarterScalarWhereWithAggregatesInput>>? AND;

  final Iterable<_i2.QuarterScalarWhereWithAggregatesInput>? OR;

  final _i1.PrismaUnion<_i2.QuarterScalarWhereWithAggregatesInput,
      Iterable<_i2.QuarterScalarWhereWithAggregatesInput>>? NOT;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? id;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? number;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? totalScore;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? madeOne;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? madeTwo;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? madeThree;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? miss;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? reboundOffensive;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? reboundDefensive;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? foul;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? turnover;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? assist;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? block;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? steal;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
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

class QuarterCountAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterCountAggregateOutputTypeSelect({
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
    this.$all,
  });

  final bool? id;

  final bool? number;

  final bool? totalScore;

  final bool? madeOne;

  final bool? madeTwo;

  final bool? madeThree;

  final bool? miss;

  final bool? reboundOffensive;

  final bool? reboundDefensive;

  final bool? foul;

  final bool? turnover;

  final bool? assist;

  final bool? block;

  final bool? steal;

  final bool? $all;

  @override
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
        '_all': $all,
      };
}

class QuarterGroupByOutputTypeCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterGroupByOutputTypeCountArgs({this.select});

  final _i2.QuarterCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class QuarterAvgAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterAvgAggregateOutputTypeSelect({
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

  final bool? id;

  final bool? number;

  final bool? totalScore;

  final bool? madeOne;

  final bool? madeTwo;

  final bool? madeThree;

  final bool? miss;

  final bool? reboundOffensive;

  final bool? reboundDefensive;

  final bool? foul;

  final bool? turnover;

  final bool? assist;

  final bool? block;

  final bool? steal;

  @override
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

class QuarterGroupByOutputTypeAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterGroupByOutputTypeAvgArgs({this.select});

  final _i2.QuarterAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class QuarterSumAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterSumAggregateOutputTypeSelect({
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

  final bool? id;

  final bool? number;

  final bool? totalScore;

  final bool? madeOne;

  final bool? madeTwo;

  final bool? madeThree;

  final bool? miss;

  final bool? reboundOffensive;

  final bool? reboundDefensive;

  final bool? foul;

  final bool? turnover;

  final bool? assist;

  final bool? block;

  final bool? steal;

  @override
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

class QuarterGroupByOutputTypeSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterGroupByOutputTypeSumArgs({this.select});

  final _i2.QuarterSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class QuarterMinAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterMinAggregateOutputTypeSelect({
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

  final bool? id;

  final bool? number;

  final bool? totalScore;

  final bool? madeOne;

  final bool? madeTwo;

  final bool? madeThree;

  final bool? miss;

  final bool? reboundOffensive;

  final bool? reboundDefensive;

  final bool? foul;

  final bool? turnover;

  final bool? assist;

  final bool? block;

  final bool? steal;

  @override
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

class QuarterGroupByOutputTypeMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterGroupByOutputTypeMinArgs({this.select});

  final _i2.QuarterMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class QuarterMaxAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterMaxAggregateOutputTypeSelect({
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

  final bool? id;

  final bool? number;

  final bool? totalScore;

  final bool? madeOne;

  final bool? madeTwo;

  final bool? madeThree;

  final bool? miss;

  final bool? reboundOffensive;

  final bool? reboundDefensive;

  final bool? foul;

  final bool? turnover;

  final bool? assist;

  final bool? block;

  final bool? steal;

  @override
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

class QuarterGroupByOutputTypeMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterGroupByOutputTypeMaxArgs({this.select});

  final _i2.QuarterMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class QuarterGroupByOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterGroupByOutputTypeSelect({
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
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final bool? id;

  final bool? number;

  final bool? totalScore;

  final bool? madeOne;

  final bool? madeTwo;

  final bool? madeThree;

  final bool? miss;

  final bool? reboundOffensive;

  final bool? reboundDefensive;

  final bool? foul;

  final bool? turnover;

  final bool? assist;

  final bool? block;

  final bool? steal;

  final _i1.PrismaUnion<bool, _i2.QuarterGroupByOutputTypeCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.QuarterGroupByOutputTypeAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.QuarterGroupByOutputTypeSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.QuarterGroupByOutputTypeMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.QuarterGroupByOutputTypeMaxArgs>? $max;

  @override
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
        '_count': $count,
        '_avg': $avg,
        '_sum': $sum,
        '_min': $min,
        '_max': $max,
      };
}

class AggregateQuarter {
  const AggregateQuarter({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory AggregateQuarter.fromJson(Map json) => AggregateQuarter(
        $count: json['_count'] is Map
            ? _i2.QuarterCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.QuarterAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.QuarterSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.QuarterMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.QuarterMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final _i2.QuarterCountAggregateOutputType? $count;

  final _i2.QuarterAvgAggregateOutputType? $avg;

  final _i2.QuarterSumAggregateOutputType? $sum;

  final _i2.QuarterMinAggregateOutputType? $min;

  final _i2.QuarterMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
        '_count': $count?.toJson(),
        '_avg': $avg?.toJson(),
        '_sum': $sum?.toJson(),
        '_min': $min?.toJson(),
        '_max': $max?.toJson(),
      };
}

class AggregateQuarterCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateQuarterCountArgs({this.select});

  final _i2.QuarterCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateQuarterAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateQuarterAvgArgs({this.select});

  final _i2.QuarterAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateQuarterSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateQuarterSumArgs({this.select});

  final _i2.QuarterSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateQuarterMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateQuarterMinArgs({this.select});

  final _i2.QuarterMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateQuarterMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateQuarterMaxArgs({this.select});

  final _i2.QuarterMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateQuarterSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateQuarterSelect({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i2.AggregateQuarterCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AggregateQuarterAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.AggregateQuarterSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.AggregateQuarterMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AggregateQuarterMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
        '_count': $count,
        '_avg': $avg,
        '_sum': $sum,
        '_min': $min,
        '_max': $max,
      };
}

class QuarterCreateWithoutLogsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterCreateWithoutLogsInput({
    required this.number,
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

  final int number;

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

  @override
  Map<String, dynamic> toJson() => {
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

class QuarterUncheckedCreateWithoutLogsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterUncheckedCreateWithoutLogsInput({
    this.id,
    required this.number,
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

  final int? id;

  final int number;

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

  @override
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

class QuarterCreateOrConnectWithoutLogsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterCreateOrConnectWithoutLogsInput({
    required this.where,
    required this.create,
  });

  final _i2.QuarterWhereUniqueInput where;

  final _i1.PrismaUnion<_i2.QuarterCreateWithoutLogsInput,
      _i2.QuarterUncheckedCreateWithoutLogsInput> create;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'create': create,
      };
}

class QuarterCreateNestedOneWithoutLogsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterCreateNestedOneWithoutLogsInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  final _i1.PrismaUnion<_i2.QuarterCreateWithoutLogsInput,
      _i2.QuarterUncheckedCreateWithoutLogsInput>? create;

  final _i2.QuarterCreateOrConnectWithoutLogsInput? connectOrCreate;

  final _i2.QuarterWhereUniqueInput? connect;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'connect': connect,
      };
}

class LogsCreateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsCreateInput({
    required this.keywordOne,
    required this.keywordTwo,
    this.keywordThree,
    required this.timestamp,
    required this.quarter,
  });

  final String keywordOne;

  final String keywordTwo;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? keywordThree;

  final DateTime timestamp;

  final _i2.QuarterCreateNestedOneWithoutLogsInput quarter;

  @override
  Map<String, dynamic> toJson() => {
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
        'quarter': quarter,
      };
}

class LogsUncheckedCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsUncheckedCreateInput({
    this.id,
    required this.keywordOne,
    required this.keywordTwo,
    this.keywordThree,
    required this.timestamp,
    required this.quarterID,
  });

  final int? id;

  final String keywordOne;

  final String keywordTwo;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? keywordThree;

  final DateTime timestamp;

  final int quarterID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
        'quarterID': quarterID,
      };
}

class LogsCreateManyInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsCreateManyInput({
    this.id,
    required this.keywordOne,
    required this.keywordTwo,
    this.keywordThree,
    required this.timestamp,
    required this.quarterID,
  });

  final int? id;

  final String keywordOne;

  final String keywordTwo;

  final _i1.PrismaUnion<String, _i1.PrismaNull>? keywordThree;

  final DateTime timestamp;

  final int quarterID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
        'quarterID': quarterID,
      };
}

class CreateManyLogsAndReturnOutputTypeQuarterArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const CreateManyLogsAndReturnOutputTypeQuarterArgs({
    this.select,
    this.include,
  });

  final _i2.QuarterSelect? select;

  final _i2.QuarterInclude? include;

  @override
  Map<String, dynamic> toJson() => {
        'select': select,
        'include': include,
      };
}

class CreateManyLogsAndReturnOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const CreateManyLogsAndReturnOutputTypeSelect({
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
    this.quarterID,
    this.quarter,
  });

  final bool? id;

  final bool? keywordOne;

  final bool? keywordTwo;

  final bool? keywordThree;

  final bool? timestamp;

  final bool? quarterID;

  final _i1.PrismaUnion<bool, _i2.CreateManyLogsAndReturnOutputTypeQuarterArgs>?
      quarter;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
        'quarterID': quarterID,
        'quarter': quarter,
      };
}

class CreateManyLogsAndReturnOutputTypeInclude
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const CreateManyLogsAndReturnOutputTypeInclude({this.quarter});

  final _i1.PrismaUnion<bool, _i2.CreateManyLogsAndReturnOutputTypeQuarterArgs>?
      quarter;

  @override
  Map<String, dynamic> toJson() => {'quarter': quarter};
}

class QuarterUpdateWithoutLogsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterUpdateWithoutLogsInput({
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

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? number;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? totalScore;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? madeOne;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? madeTwo;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? madeThree;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? miss;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>?
      reboundOffensive;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>?
      reboundDefensive;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? foul;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? turnover;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? assist;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? block;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? steal;

  @override
  Map<String, dynamic> toJson() => {
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

class QuarterUncheckedUpdateWithoutLogsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterUncheckedUpdateWithoutLogsInput({
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

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? number;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? totalScore;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? madeOne;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? madeTwo;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? madeThree;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? miss;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>?
      reboundOffensive;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>?
      reboundDefensive;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? foul;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? turnover;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? assist;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? block;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? steal;

  @override
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

class QuarterUpsertWithoutLogsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterUpsertWithoutLogsInput({
    required this.update,
    required this.create,
    this.where,
  });

  final _i1.PrismaUnion<_i2.QuarterUpdateWithoutLogsInput,
      _i2.QuarterUncheckedUpdateWithoutLogsInput> update;

  final _i1.PrismaUnion<_i2.QuarterCreateWithoutLogsInput,
      _i2.QuarterUncheckedCreateWithoutLogsInput> create;

  final _i2.QuarterWhereInput? where;

  @override
  Map<String, dynamic> toJson() => {
        'update': update,
        'create': create,
        'where': where,
      };
}

class QuarterUpdateToOneWithWhereWithoutLogsInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterUpdateToOneWithWhereWithoutLogsInput({
    this.where,
    required this.data,
  });

  final _i2.QuarterWhereInput? where;

  final _i1.PrismaUnion<_i2.QuarterUpdateWithoutLogsInput,
      _i2.QuarterUncheckedUpdateWithoutLogsInput> data;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'data': data,
      };
}

class QuarterUpdateOneRequiredWithoutLogsNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const QuarterUpdateOneRequiredWithoutLogsNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.connect,
    this.update,
  });

  final _i1.PrismaUnion<_i2.QuarterCreateWithoutLogsInput,
      _i2.QuarterUncheckedCreateWithoutLogsInput>? create;

  final _i2.QuarterCreateOrConnectWithoutLogsInput? connectOrCreate;

  final _i2.QuarterUpsertWithoutLogsInput? upsert;

  final _i2.QuarterWhereUniqueInput? connect;

  final _i1.PrismaUnion<
      _i2.QuarterUpdateToOneWithWhereWithoutLogsInput,
      _i1.PrismaUnion<_i2.QuarterUpdateWithoutLogsInput,
          _i2.QuarterUncheckedUpdateWithoutLogsInput>>? update;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'upsert': upsert,
        'connect': connect,
        'update': update,
      };
}

class LogsUpdateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsUpdateInput({
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
    this.quarter,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      keywordOne;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      keywordTwo;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? keywordThree;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      timestamp;

  final _i2.QuarterUpdateOneRequiredWithoutLogsNestedInput? quarter;

  @override
  Map<String, dynamic> toJson() => {
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
        'quarter': quarter,
      };
}

class LogsUncheckedUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsUncheckedUpdateInput({
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
    this.quarterID,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      keywordOne;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      keywordTwo;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? keywordThree;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      timestamp;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? quarterID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
        'quarterID': quarterID,
      };
}

class LogsUncheckedUpdateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsUncheckedUpdateManyInput({
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
    this.quarterID,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      keywordOne;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      keywordTwo;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NullableStringFieldUpdateOperationsInput,
          _i1.PrismaNull>>? keywordThree;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>?
      timestamp;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? quarterID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
        'quarterID': quarterID,
      };
}

class LogsCountAggregateOutputType {
  const LogsCountAggregateOutputType({
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
    this.quarterID,
    this.$all,
  });

  factory LogsCountAggregateOutputType.fromJson(Map json) =>
      LogsCountAggregateOutputType(
        id: json['id'],
        keywordOne: json['keywordOne'],
        keywordTwo: json['keywordTwo'],
        keywordThree: json['keywordThree'],
        timestamp: json['timestamp'],
        quarterID: json['quarterID'],
        $all: json['_all'],
      );

  final int? id;

  final int? keywordOne;

  final int? keywordTwo;

  final int? keywordThree;

  final int? timestamp;

  final int? quarterID;

  final int? $all;

  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
        'quarterID': quarterID,
        '_all': $all,
      };
}

class LogsAvgAggregateOutputType {
  const LogsAvgAggregateOutputType({
    this.id,
    this.quarterID,
  });

  factory LogsAvgAggregateOutputType.fromJson(Map json) =>
      LogsAvgAggregateOutputType(
        id: json['id'],
        quarterID: json['quarterID'],
      );

  final double? id;

  final double? quarterID;

  Map<String, dynamic> toJson() => {
        'id': id,
        'quarterID': quarterID,
      };
}

class LogsSumAggregateOutputType {
  const LogsSumAggregateOutputType({
    this.id,
    this.quarterID,
  });

  factory LogsSumAggregateOutputType.fromJson(Map json) =>
      LogsSumAggregateOutputType(
        id: json['id'],
        quarterID: json['quarterID'],
      );

  final int? id;

  final int? quarterID;

  Map<String, dynamic> toJson() => {
        'id': id,
        'quarterID': quarterID,
      };
}

class LogsMinAggregateOutputType {
  const LogsMinAggregateOutputType({
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
    this.quarterID,
  });

  factory LogsMinAggregateOutputType.fromJson(Map json) =>
      LogsMinAggregateOutputType(
        id: json['id'],
        keywordOne: json['keywordOne'],
        keywordTwo: json['keywordTwo'],
        keywordThree: json['keywordThree'],
        timestamp: switch (json['timestamp']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['timestamp']
        },
        quarterID: json['quarterID'],
      );

  final int? id;

  final String? keywordOne;

  final String? keywordTwo;

  final String? keywordThree;

  final DateTime? timestamp;

  final int? quarterID;

  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp?.toIso8601String(),
        'quarterID': quarterID,
      };
}

class LogsMaxAggregateOutputType {
  const LogsMaxAggregateOutputType({
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
    this.quarterID,
  });

  factory LogsMaxAggregateOutputType.fromJson(Map json) =>
      LogsMaxAggregateOutputType(
        id: json['id'],
        keywordOne: json['keywordOne'],
        keywordTwo: json['keywordTwo'],
        keywordThree: json['keywordThree'],
        timestamp: switch (json['timestamp']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['timestamp']
        },
        quarterID: json['quarterID'],
      );

  final int? id;

  final String? keywordOne;

  final String? keywordTwo;

  final String? keywordThree;

  final DateTime? timestamp;

  final int? quarterID;

  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp?.toIso8601String(),
        'quarterID': quarterID,
      };
}

class LogsGroupByOutputType {
  const LogsGroupByOutputType({
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
    this.quarterID,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory LogsGroupByOutputType.fromJson(Map json) => LogsGroupByOutputType(
        id: json['id'],
        keywordOne: json['keywordOne'],
        keywordTwo: json['keywordTwo'],
        keywordThree: json['keywordThree'],
        timestamp: switch (json['timestamp']) {
          DateTime value => value,
          String value => DateTime.parse(value),
          _ => json['timestamp']
        },
        quarterID: json['quarterID'],
        $count: json['_count'] is Map
            ? _i2.LogsCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.LogsAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.LogsSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.LogsMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.LogsMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final int? id;

  final String? keywordOne;

  final String? keywordTwo;

  final String? keywordThree;

  final DateTime? timestamp;

  final int? quarterID;

  final _i2.LogsCountAggregateOutputType? $count;

  final _i2.LogsAvgAggregateOutputType? $avg;

  final _i2.LogsSumAggregateOutputType? $sum;

  final _i2.LogsMinAggregateOutputType? $min;

  final _i2.LogsMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp?.toIso8601String(),
        'quarterID': quarterID,
        '_count': $count?.toJson(),
        '_avg': $avg?.toJson(),
        '_sum': $sum?.toJson(),
        '_min': $min?.toJson(),
        '_max': $max?.toJson(),
      };
}

class LogsCountOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsCountOrderByAggregateInput({
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
    this.quarterID,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? keywordOne;

  final _i2.SortOrder? keywordTwo;

  final _i2.SortOrder? keywordThree;

  final _i2.SortOrder? timestamp;

  final _i2.SortOrder? quarterID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
        'quarterID': quarterID,
      };
}

class LogsAvgOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsAvgOrderByAggregateInput({
    this.id,
    this.quarterID,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? quarterID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'quarterID': quarterID,
      };
}

class LogsMaxOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsMaxOrderByAggregateInput({
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
    this.quarterID,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? keywordOne;

  final _i2.SortOrder? keywordTwo;

  final _i2.SortOrder? keywordThree;

  final _i2.SortOrder? timestamp;

  final _i2.SortOrder? quarterID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
        'quarterID': quarterID,
      };
}

class LogsMinOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsMinOrderByAggregateInput({
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
    this.quarterID,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? keywordOne;

  final _i2.SortOrder? keywordTwo;

  final _i2.SortOrder? keywordThree;

  final _i2.SortOrder? timestamp;

  final _i2.SortOrder? quarterID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
        'quarterID': quarterID,
      };
}

class LogsSumOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsSumOrderByAggregateInput({
    this.id,
    this.quarterID,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? quarterID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'quarterID': quarterID,
      };
}

class LogsOrderByWithAggregationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsOrderByWithAggregationInput({
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
    this.quarterID,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? keywordOne;

  final _i2.SortOrder? keywordTwo;

  final _i1.PrismaUnion<_i2.SortOrder, _i2.SortOrderInput>? keywordThree;

  final _i2.SortOrder? timestamp;

  final _i2.SortOrder? quarterID;

  final _i2.LogsCountOrderByAggregateInput? $count;

  final _i2.LogsAvgOrderByAggregateInput? $avg;

  final _i2.LogsMaxOrderByAggregateInput? $max;

  final _i2.LogsMinOrderByAggregateInput? $min;

  final _i2.LogsSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
        'quarterID': quarterID,
        '_count': $count,
        '_avg': $avg,
        '_max': $max,
        '_min': $min,
        '_sum': $sum,
      };
}

class NestedIntNullableFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedIntNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  final _i1
      .PrismaUnion<int, _i1.PrismaUnion<_i1.Reference<int>, _i1.PrismaNull>>?
      equals;

  final _i1.PrismaUnion<Iterable<int>, _i1.PrismaNull>? $in;

  final _i1.PrismaUnion<Iterable<int>, _i1.PrismaNull>? notIn;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? lte;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gt;

  final _i1.PrismaUnion<int, _i1.Reference<int>>? gte;

  final _i1.PrismaUnion<int,
      _i1.PrismaUnion<_i2.NestedIntNullableFilter, _i1.PrismaNull>>? not;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'not': not,
      };
}

class NestedStringNullableWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const NestedStringNullableWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<String,
      _i1.PrismaUnion<_i1.Reference<String>, _i1.PrismaNull>>? equals;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? $in;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NestedStringNullableWithAggregatesFilter,
          _i1.PrismaNull>>? not;

  final _i2.NestedIntNullableFilter? $count;

  final _i2.NestedStringNullableFilter? $min;

  final _i2.NestedStringNullableFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'not': not,
        '_count': $count,
        '_min': $min,
        '_max': $max,
      };
}

class StringNullableWithAggregatesFilter
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const StringNullableWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<String,
      _i1.PrismaUnion<_i1.Reference<String>, _i1.PrismaNull>>? equals;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? $in;

  final _i1.PrismaUnion<Iterable<String>, _i1.PrismaNull>? notIn;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? lte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gt;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? gte;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? contains;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? startsWith;

  final _i1.PrismaUnion<String, _i1.Reference<String>>? endsWith;

  final _i1.PrismaUnion<
      String,
      _i1.PrismaUnion<_i2.NestedStringNullableWithAggregatesFilter,
          _i1.PrismaNull>>? not;

  final _i2.NestedIntNullableFilter? $count;

  final _i2.NestedStringNullableFilter? $min;

  final _i2.NestedStringNullableFilter? $max;

  @override
  Map<String, dynamic> toJson() => {
        'equals': equals,
        'in': $in,
        'notIn': notIn,
        'lt': lt,
        'lte': lte,
        'gt': gt,
        'gte': gte,
        'contains': contains,
        'startsWith': startsWith,
        'endsWith': endsWith,
        'not': not,
        '_count': $count,
        '_min': $min,
        '_max': $max,
      };
}

class LogsScalarWhereWithAggregatesInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
    this.quarterID,
  });

  final _i1.PrismaUnion<_i2.LogsScalarWhereWithAggregatesInput,
      Iterable<_i2.LogsScalarWhereWithAggregatesInput>>? AND;

  final Iterable<_i2.LogsScalarWhereWithAggregatesInput>? OR;

  final _i1.PrismaUnion<_i2.LogsScalarWhereWithAggregatesInput,
      Iterable<_i2.LogsScalarWhereWithAggregatesInput>>? NOT;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? keywordOne;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? keywordTwo;

  final _i1.PrismaUnion<_i2.StringNullableWithAggregatesFilter,
      _i1.PrismaUnion<String, _i1.PrismaNull>>? keywordThree;

  final _i1.PrismaUnion<_i2.DateTimeWithAggregatesFilter, DateTime>? timestamp;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? quarterID;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
        'quarterID': quarterID,
      };
}

class LogsCountAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsCountAggregateOutputTypeSelect({
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
    this.quarterID,
    this.$all,
  });

  final bool? id;

  final bool? keywordOne;

  final bool? keywordTwo;

  final bool? keywordThree;

  final bool? timestamp;

  final bool? quarterID;

  final bool? $all;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
        'quarterID': quarterID,
        '_all': $all,
      };
}

class LogsGroupByOutputTypeCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsGroupByOutputTypeCountArgs({this.select});

  final _i2.LogsCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class LogsAvgAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsAvgAggregateOutputTypeSelect({
    this.id,
    this.quarterID,
  });

  final bool? id;

  final bool? quarterID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'quarterID': quarterID,
      };
}

class LogsGroupByOutputTypeAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsGroupByOutputTypeAvgArgs({this.select});

  final _i2.LogsAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class LogsSumAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsSumAggregateOutputTypeSelect({
    this.id,
    this.quarterID,
  });

  final bool? id;

  final bool? quarterID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'quarterID': quarterID,
      };
}

class LogsGroupByOutputTypeSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsGroupByOutputTypeSumArgs({this.select});

  final _i2.LogsSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class LogsMinAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsMinAggregateOutputTypeSelect({
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
    this.quarterID,
  });

  final bool? id;

  final bool? keywordOne;

  final bool? keywordTwo;

  final bool? keywordThree;

  final bool? timestamp;

  final bool? quarterID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
        'quarterID': quarterID,
      };
}

class LogsGroupByOutputTypeMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsGroupByOutputTypeMinArgs({this.select});

  final _i2.LogsMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class LogsMaxAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsMaxAggregateOutputTypeSelect({
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
    this.quarterID,
  });

  final bool? id;

  final bool? keywordOne;

  final bool? keywordTwo;

  final bool? keywordThree;

  final bool? timestamp;

  final bool? quarterID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
        'quarterID': quarterID,
      };
}

class LogsGroupByOutputTypeMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsGroupByOutputTypeMaxArgs({this.select});

  final _i2.LogsMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class LogsGroupByOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const LogsGroupByOutputTypeSelect({
    this.id,
    this.keywordOne,
    this.keywordTwo,
    this.keywordThree,
    this.timestamp,
    this.quarterID,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final bool? id;

  final bool? keywordOne;

  final bool? keywordTwo;

  final bool? keywordThree;

  final bool? timestamp;

  final bool? quarterID;

  final _i1.PrismaUnion<bool, _i2.LogsGroupByOutputTypeCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.LogsGroupByOutputTypeAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.LogsGroupByOutputTypeSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.LogsGroupByOutputTypeMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.LogsGroupByOutputTypeMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'keywordOne': keywordOne,
        'keywordTwo': keywordTwo,
        'keywordThree': keywordThree,
        'timestamp': timestamp,
        'quarterID': quarterID,
        '_count': $count,
        '_avg': $avg,
        '_sum': $sum,
        '_min': $min,
        '_max': $max,
      };
}

class AggregateLogs {
  const AggregateLogs({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory AggregateLogs.fromJson(Map json) => AggregateLogs(
        $count: json['_count'] is Map
            ? _i2.LogsCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.LogsAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.LogsSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.LogsMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.LogsMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final _i2.LogsCountAggregateOutputType? $count;

  final _i2.LogsAvgAggregateOutputType? $avg;

  final _i2.LogsSumAggregateOutputType? $sum;

  final _i2.LogsMinAggregateOutputType? $min;

  final _i2.LogsMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
        '_count': $count?.toJson(),
        '_avg': $avg?.toJson(),
        '_sum': $sum?.toJson(),
        '_min': $min?.toJson(),
        '_max': $max?.toJson(),
      };
}

class AggregateLogsCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateLogsCountArgs({this.select});

  final _i2.LogsCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateLogsAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateLogsAvgArgs({this.select});

  final _i2.LogsAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateLogsSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateLogsSumArgs({this.select});

  final _i2.LogsSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateLogsMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateLogsMinArgs({this.select});

  final _i2.LogsMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateLogsMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateLogsMaxArgs({this.select});

  final _i2.LogsMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateLogsSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateLogsSelect({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i2.AggregateLogsCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AggregateLogsAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.AggregateLogsSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.AggregateLogsMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AggregateLogsMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
        '_count': $count,
        '_avg': $avg,
        '_sum': $sum,
        '_min': $min,
        '_max': $max,
      };
}

enum TeamScalar<T> implements _i1.PrismaEnum, _i1.Reference<T> {
  id<int>('id', 'Team'),
  name$<String>('name', 'Team');

  const TeamScalar(
    this.name,
    this.model,
  );

  @override
  final String name;

  @override
  final String model;
}

class GameCreateWithoutTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameCreateWithoutTeamInput({
    required this.title,
    required this.date,
    required this.semester,
  });

  final String title;

  final DateTime date;

  final String semester;

  @override
  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'semester': semester,
      };
}

class GameUncheckedCreateWithoutTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameUncheckedCreateWithoutTeamInput({
    this.id,
    required this.title,
    required this.date,
    required this.semester,
  });

  final int? id;

  final String title;

  final DateTime date;

  final String semester;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
      };
}

class GameCreateOrConnectWithoutTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameCreateOrConnectWithoutTeamInput({
    required this.where,
    required this.create,
  });

  final _i2.GameWhereUniqueInput where;

  final _i1.PrismaUnion<_i2.GameCreateWithoutTeamInput,
      _i2.GameUncheckedCreateWithoutTeamInput> create;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'create': create,
      };
}

class GameCreateManyTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameCreateManyTeamInput({
    this.id,
    required this.title,
    required this.date,
    required this.semester,
  });

  final int? id;

  final String title;

  final DateTime date;

  final String semester;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
      };
}

class GameCreateManyTeamInputEnvelope
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameCreateManyTeamInputEnvelope({required this.data});

  final _i1.PrismaUnion<_i2.GameCreateManyTeamInput,
      Iterable<_i2.GameCreateManyTeamInput>> data;

  @override
  Map<String, dynamic> toJson() => {'data': data};
}

class GameCreateNestedManyWithoutTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameCreateNestedManyWithoutTeamInput({
    this.create,
    this.connectOrCreate,
    this.createMany,
    this.connect,
  });

  final _i1.PrismaUnion<
      _i2.GameCreateWithoutTeamInput,
      _i1.PrismaUnion<
          Iterable<_i2.GameCreateWithoutTeamInput>,
          _i1.PrismaUnion<_i2.GameUncheckedCreateWithoutTeamInput,
              Iterable<_i2.GameUncheckedCreateWithoutTeamInput>>>>? create;

  final _i1.PrismaUnion<_i2.GameCreateOrConnectWithoutTeamInput,
      Iterable<_i2.GameCreateOrConnectWithoutTeamInput>>? connectOrCreate;

  final _i2.GameCreateManyTeamInputEnvelope? createMany;

  final _i1.PrismaUnion<_i2.GameWhereUniqueInput,
      Iterable<_i2.GameWhereUniqueInput>>? connect;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'createMany': createMany,
        'connect': connect,
      };
}

class TeamCreateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamCreateInput({
    required this.name,
    this.game,
    this.player,
  });

  final String name;

  final _i2.GameCreateNestedManyWithoutTeamInput? game;

  final _i2.PlayerCreateNestedManyWithoutTeamInput? player;

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'Game': game,
        'Player': player,
      };
}

class GameUncheckedCreateNestedManyWithoutTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameUncheckedCreateNestedManyWithoutTeamInput({
    this.create,
    this.connectOrCreate,
    this.createMany,
    this.connect,
  });

  final _i1.PrismaUnion<
      _i2.GameCreateWithoutTeamInput,
      _i1.PrismaUnion<
          Iterable<_i2.GameCreateWithoutTeamInput>,
          _i1.PrismaUnion<_i2.GameUncheckedCreateWithoutTeamInput,
              Iterable<_i2.GameUncheckedCreateWithoutTeamInput>>>>? create;

  final _i1.PrismaUnion<_i2.GameCreateOrConnectWithoutTeamInput,
      Iterable<_i2.GameCreateOrConnectWithoutTeamInput>>? connectOrCreate;

  final _i2.GameCreateManyTeamInputEnvelope? createMany;

  final _i1.PrismaUnion<_i2.GameWhereUniqueInput,
      Iterable<_i2.GameWhereUniqueInput>>? connect;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'createMany': createMany,
        'connect': connect,
      };
}

class TeamUncheckedCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamUncheckedCreateInput({
    this.id,
    required this.name,
    this.game,
    this.player,
  });

  final int? id;

  final String name;

  final _i2.GameUncheckedCreateNestedManyWithoutTeamInput? game;

  final _i2.PlayerUncheckedCreateNestedManyWithoutTeamInput? player;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'Game': game,
        'Player': player,
      };
}

class TeamCreateManyInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamCreateManyInput({
    this.id,
    required this.name,
  });

  final int? id;

  final String name;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class CreateManyTeamAndReturnOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const CreateManyTeamAndReturnOutputTypeSelect({
    this.id,
    this.name,
  });

  final bool? id;

  final bool? name;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class GameUpdateWithoutTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameUpdateWithoutTeamInput({
    this.title,
    this.date,
    this.semester,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? title;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>? date;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? semester;

  @override
  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'semester': semester,
      };
}

class GameUncheckedUpdateWithoutTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameUncheckedUpdateWithoutTeamInput({
    this.id,
    this.title,
    this.date,
    this.semester,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? title;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>? date;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? semester;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
      };
}

class GameUpsertWithWhereUniqueWithoutTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameUpsertWithWhereUniqueWithoutTeamInput({
    required this.where,
    required this.update,
    required this.create,
  });

  final _i2.GameWhereUniqueInput where;

  final _i1.PrismaUnion<_i2.GameUpdateWithoutTeamInput,
      _i2.GameUncheckedUpdateWithoutTeamInput> update;

  final _i1.PrismaUnion<_i2.GameCreateWithoutTeamInput,
      _i2.GameUncheckedCreateWithoutTeamInput> create;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'update': update,
        'create': create,
      };
}

class GameUpdateWithWhereUniqueWithoutTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameUpdateWithWhereUniqueWithoutTeamInput({
    required this.where,
    required this.data,
  });

  final _i2.GameWhereUniqueInput where;

  final _i1.PrismaUnion<_i2.GameUpdateWithoutTeamInput,
      _i2.GameUncheckedUpdateWithoutTeamInput> data;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'data': data,
      };
}

class GameScalarWhereInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameScalarWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.title,
    this.date,
    this.semester,
    this.teamID,
  });

  final _i1.PrismaUnion<_i2.GameScalarWhereInput,
      Iterable<_i2.GameScalarWhereInput>>? AND;

  final Iterable<_i2.GameScalarWhereInput>? OR;

  final _i1.PrismaUnion<_i2.GameScalarWhereInput,
      Iterable<_i2.GameScalarWhereInput>>? NOT;

  final _i1.PrismaUnion<_i2.IntFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringFilter, String>? title;

  final _i1.PrismaUnion<_i2.DateTimeFilter, DateTime>? date;

  final _i1.PrismaUnion<_i2.StringFilter, String>? semester;

  final _i1.PrismaUnion<_i2.IntFilter, int>? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
        'teamID': teamID,
      };
}

class GameUncheckedUpdateManyWithoutTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameUncheckedUpdateManyWithoutTeamInput({
    this.id,
    this.title,
    this.date,
    this.semester,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? title;

  final _i1.PrismaUnion<DateTime, _i2.DateTimeFieldUpdateOperationsInput>? date;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? semester;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'semester': semester,
      };
}

class GameUpdateManyWithWhereWithoutTeamInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameUpdateManyWithWhereWithoutTeamInput({
    required this.where,
    required this.data,
  });

  final _i2.GameScalarWhereInput where;

  final _i1.PrismaUnion<_i2.GameUpdateManyMutationInput,
      _i2.GameUncheckedUpdateManyWithoutTeamInput> data;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'data': data,
      };
}

class GameUpdateManyWithoutTeamNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameUpdateManyWithoutTeamNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.createMany,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  final _i1.PrismaUnion<
      _i2.GameCreateWithoutTeamInput,
      _i1.PrismaUnion<
          Iterable<_i2.GameCreateWithoutTeamInput>,
          _i1.PrismaUnion<_i2.GameUncheckedCreateWithoutTeamInput,
              Iterable<_i2.GameUncheckedCreateWithoutTeamInput>>>>? create;

  final _i1.PrismaUnion<_i2.GameCreateOrConnectWithoutTeamInput,
      Iterable<_i2.GameCreateOrConnectWithoutTeamInput>>? connectOrCreate;

  final _i1.PrismaUnion<_i2.GameUpsertWithWhereUniqueWithoutTeamInput,
      Iterable<_i2.GameUpsertWithWhereUniqueWithoutTeamInput>>? upsert;

  final _i2.GameCreateManyTeamInputEnvelope? createMany;

  final _i1.PrismaUnion<_i2.GameWhereUniqueInput,
      Iterable<_i2.GameWhereUniqueInput>>? set;

  final _i1.PrismaUnion<_i2.GameWhereUniqueInput,
      Iterable<_i2.GameWhereUniqueInput>>? disconnect;

  final _i1.PrismaUnion<_i2.GameWhereUniqueInput,
      Iterable<_i2.GameWhereUniqueInput>>? delete;

  final _i1.PrismaUnion<_i2.GameWhereUniqueInput,
      Iterable<_i2.GameWhereUniqueInput>>? connect;

  final _i1.PrismaUnion<_i2.GameUpdateWithWhereUniqueWithoutTeamInput,
      Iterable<_i2.GameUpdateWithWhereUniqueWithoutTeamInput>>? update;

  final _i1.PrismaUnion<_i2.GameUpdateManyWithWhereWithoutTeamInput,
      Iterable<_i2.GameUpdateManyWithWhereWithoutTeamInput>>? updateMany;

  final _i1.PrismaUnion<_i2.GameScalarWhereInput,
      Iterable<_i2.GameScalarWhereInput>>? deleteMany;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'upsert': upsert,
        'createMany': createMany,
        'set': set,
        'disconnect': disconnect,
        'delete': delete,
        'connect': connect,
        'update': update,
        'updateMany': updateMany,
        'deleteMany': deleteMany,
      };
}

class TeamUpdateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamUpdateInput({
    this.name,
    this.game,
    this.player,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? name;

  final _i2.GameUpdateManyWithoutTeamNestedInput? game;

  final _i2.PlayerUpdateManyWithoutTeamNestedInput? player;

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'Game': game,
        'Player': player,
      };
}

class GameUncheckedUpdateManyWithoutTeamNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const GameUncheckedUpdateManyWithoutTeamNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.createMany,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  final _i1.PrismaUnion<
      _i2.GameCreateWithoutTeamInput,
      _i1.PrismaUnion<
          Iterable<_i2.GameCreateWithoutTeamInput>,
          _i1.PrismaUnion<_i2.GameUncheckedCreateWithoutTeamInput,
              Iterable<_i2.GameUncheckedCreateWithoutTeamInput>>>>? create;

  final _i1.PrismaUnion<_i2.GameCreateOrConnectWithoutTeamInput,
      Iterable<_i2.GameCreateOrConnectWithoutTeamInput>>? connectOrCreate;

  final _i1.PrismaUnion<_i2.GameUpsertWithWhereUniqueWithoutTeamInput,
      Iterable<_i2.GameUpsertWithWhereUniqueWithoutTeamInput>>? upsert;

  final _i2.GameCreateManyTeamInputEnvelope? createMany;

  final _i1.PrismaUnion<_i2.GameWhereUniqueInput,
      Iterable<_i2.GameWhereUniqueInput>>? set;

  final _i1.PrismaUnion<_i2.GameWhereUniqueInput,
      Iterable<_i2.GameWhereUniqueInput>>? disconnect;

  final _i1.PrismaUnion<_i2.GameWhereUniqueInput,
      Iterable<_i2.GameWhereUniqueInput>>? delete;

  final _i1.PrismaUnion<_i2.GameWhereUniqueInput,
      Iterable<_i2.GameWhereUniqueInput>>? connect;

  final _i1.PrismaUnion<_i2.GameUpdateWithWhereUniqueWithoutTeamInput,
      Iterable<_i2.GameUpdateWithWhereUniqueWithoutTeamInput>>? update;

  final _i1.PrismaUnion<_i2.GameUpdateManyWithWhereWithoutTeamInput,
      Iterable<_i2.GameUpdateManyWithWhereWithoutTeamInput>>? updateMany;

  final _i1.PrismaUnion<_i2.GameScalarWhereInput,
      Iterable<_i2.GameScalarWhereInput>>? deleteMany;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'upsert': upsert,
        'createMany': createMany,
        'set': set,
        'disconnect': disconnect,
        'delete': delete,
        'connect': connect,
        'update': update,
        'updateMany': updateMany,
        'deleteMany': deleteMany,
      };
}

class TeamUncheckedUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamUncheckedUpdateInput({
    this.id,
    this.name,
    this.game,
    this.player,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? name;

  final _i2.GameUncheckedUpdateManyWithoutTeamNestedInput? game;

  final _i2.PlayerUncheckedUpdateManyWithoutTeamNestedInput? player;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'Game': game,
        'Player': player,
      };
}

class TeamUpdateManyMutationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamUpdateManyMutationInput({this.name});

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? name;

  @override
  Map<String, dynamic> toJson() => {'name': name};
}

class TeamUncheckedUpdateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamUncheckedUpdateManyInput({
    this.id,
    this.name,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? name;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class TeamCountAggregateOutputType {
  const TeamCountAggregateOutputType({
    this.id,
    this.name,
    this.$all,
  });

  factory TeamCountAggregateOutputType.fromJson(Map json) =>
      TeamCountAggregateOutputType(
        id: json['id'],
        name: json['name'],
        $all: json['_all'],
      );

  final int? id;

  final int? name;

  final int? $all;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        '_all': $all,
      };
}

class TeamAvgAggregateOutputType {
  const TeamAvgAggregateOutputType({this.id});

  factory TeamAvgAggregateOutputType.fromJson(Map json) =>
      TeamAvgAggregateOutputType(id: json['id']);

  final double? id;

  Map<String, dynamic> toJson() => {'id': id};
}

class TeamSumAggregateOutputType {
  const TeamSumAggregateOutputType({this.id});

  factory TeamSumAggregateOutputType.fromJson(Map json) =>
      TeamSumAggregateOutputType(id: json['id']);

  final int? id;

  Map<String, dynamic> toJson() => {'id': id};
}

class TeamMinAggregateOutputType {
  const TeamMinAggregateOutputType({
    this.id,
    this.name,
  });

  factory TeamMinAggregateOutputType.fromJson(Map json) =>
      TeamMinAggregateOutputType(
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

class TeamMaxAggregateOutputType {
  const TeamMaxAggregateOutputType({
    this.id,
    this.name,
  });

  factory TeamMaxAggregateOutputType.fromJson(Map json) =>
      TeamMaxAggregateOutputType(
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

class TeamGroupByOutputType {
  const TeamGroupByOutputType({
    this.id,
    this.name,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory TeamGroupByOutputType.fromJson(Map json) => TeamGroupByOutputType(
        id: json['id'],
        name: json['name'],
        $count: json['_count'] is Map
            ? _i2.TeamCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.TeamAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.TeamSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.TeamMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.TeamMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final int? id;

  final String? name;

  final _i2.TeamCountAggregateOutputType? $count;

  final _i2.TeamAvgAggregateOutputType? $avg;

  final _i2.TeamSumAggregateOutputType? $sum;

  final _i2.TeamMinAggregateOutputType? $min;

  final _i2.TeamMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        '_count': $count?.toJson(),
        '_avg': $avg?.toJson(),
        '_sum': $sum?.toJson(),
        '_min': $min?.toJson(),
        '_max': $max?.toJson(),
      };
}

class TeamCountOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamCountOrderByAggregateInput({
    this.id,
    this.name,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? name;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class TeamAvgOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamAvgOrderByAggregateInput({this.id});

  final _i2.SortOrder? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class TeamMaxOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamMaxOrderByAggregateInput({
    this.id,
    this.name,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? name;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class TeamMinOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamMinOrderByAggregateInput({
    this.id,
    this.name,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? name;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class TeamSumOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamSumOrderByAggregateInput({this.id});

  final _i2.SortOrder? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class TeamOrderByWithAggregationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamOrderByWithAggregationInput({
    this.id,
    this.name,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? name;

  final _i2.TeamCountOrderByAggregateInput? $count;

  final _i2.TeamAvgOrderByAggregateInput? $avg;

  final _i2.TeamMaxOrderByAggregateInput? $max;

  final _i2.TeamMinOrderByAggregateInput? $min;

  final _i2.TeamSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        '_count': $count,
        '_avg': $avg,
        '_max': $max,
        '_min': $min,
        '_sum': $sum,
      };
}

class TeamScalarWhereWithAggregatesInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.name,
  });

  final _i1.PrismaUnion<_i2.TeamScalarWhereWithAggregatesInput,
      Iterable<_i2.TeamScalarWhereWithAggregatesInput>>? AND;

  final Iterable<_i2.TeamScalarWhereWithAggregatesInput>? OR;

  final _i1.PrismaUnion<_i2.TeamScalarWhereWithAggregatesInput,
      Iterable<_i2.TeamScalarWhereWithAggregatesInput>>? NOT;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? name;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'name': name,
      };
}

class TeamCountAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamCountAggregateOutputTypeSelect({
    this.id,
    this.name,
    this.$all,
  });

  final bool? id;

  final bool? name;

  final bool? $all;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        '_all': $all,
      };
}

class TeamGroupByOutputTypeCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamGroupByOutputTypeCountArgs({this.select});

  final _i2.TeamCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class TeamAvgAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamAvgAggregateOutputTypeSelect({this.id});

  final bool? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class TeamGroupByOutputTypeAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamGroupByOutputTypeAvgArgs({this.select});

  final _i2.TeamAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class TeamSumAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamSumAggregateOutputTypeSelect({this.id});

  final bool? id;

  @override
  Map<String, dynamic> toJson() => {'id': id};
}

class TeamGroupByOutputTypeSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamGroupByOutputTypeSumArgs({this.select});

  final _i2.TeamSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class TeamMinAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamMinAggregateOutputTypeSelect({
    this.id,
    this.name,
  });

  final bool? id;

  final bool? name;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class TeamGroupByOutputTypeMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamGroupByOutputTypeMinArgs({this.select});

  final _i2.TeamMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class TeamMaxAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamMaxAggregateOutputTypeSelect({
    this.id,
    this.name,
  });

  final bool? id;

  final bool? name;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class TeamGroupByOutputTypeMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamGroupByOutputTypeMaxArgs({this.select});

  final _i2.TeamMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class TeamGroupByOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamGroupByOutputTypeSelect({
    this.id,
    this.name,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final bool? id;

  final bool? name;

  final _i1.PrismaUnion<bool, _i2.TeamGroupByOutputTypeCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.TeamGroupByOutputTypeAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.TeamGroupByOutputTypeSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.TeamGroupByOutputTypeMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.TeamGroupByOutputTypeMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        '_count': $count,
        '_avg': $avg,
        '_sum': $sum,
        '_min': $min,
        '_max': $max,
      };
}

class AggregateTeam {
  const AggregateTeam({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory AggregateTeam.fromJson(Map json) => AggregateTeam(
        $count: json['_count'] is Map
            ? _i2.TeamCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.TeamAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.TeamSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.TeamMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.TeamMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final _i2.TeamCountAggregateOutputType? $count;

  final _i2.TeamAvgAggregateOutputType? $avg;

  final _i2.TeamSumAggregateOutputType? $sum;

  final _i2.TeamMinAggregateOutputType? $min;

  final _i2.TeamMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
        '_count': $count?.toJson(),
        '_avg': $avg?.toJson(),
        '_sum': $sum?.toJson(),
        '_min': $min?.toJson(),
        '_max': $max?.toJson(),
      };
}

class AggregateTeamCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateTeamCountArgs({this.select});

  final _i2.TeamCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateTeamAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateTeamAvgArgs({this.select});

  final _i2.TeamAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateTeamSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateTeamSumArgs({this.select});

  final _i2.TeamSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateTeamMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateTeamMinArgs({this.select});

  final _i2.TeamMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateTeamMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateTeamMaxArgs({this.select});

  final _i2.TeamMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregateTeamSelect implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregateTeamSelect({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i2.AggregateTeamCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AggregateTeamAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.AggregateTeamSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.AggregateTeamMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AggregateTeamMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
        '_count': $count,
        '_avg': $avg,
        '_sum': $sum,
        '_min': $min,
        '_max': $max,
      };
}

class TeamCreateWithoutPlayerInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamCreateWithoutPlayerInput({
    required this.name,
    this.game,
  });

  final String name;

  final _i2.GameCreateNestedManyWithoutTeamInput? game;

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'Game': game,
      };
}

class TeamUncheckedCreateWithoutPlayerInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamUncheckedCreateWithoutPlayerInput({
    this.id,
    required this.name,
    this.game,
  });

  final int? id;

  final String name;

  final _i2.GameUncheckedCreateNestedManyWithoutTeamInput? game;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'Game': game,
      };
}

class TeamCreateOrConnectWithoutPlayerInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamCreateOrConnectWithoutPlayerInput({
    required this.where,
    required this.create,
  });

  final _i2.TeamWhereUniqueInput where;

  final _i1.PrismaUnion<_i2.TeamCreateWithoutPlayerInput,
      _i2.TeamUncheckedCreateWithoutPlayerInput> create;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'create': create,
      };
}

class TeamCreateNestedOneWithoutPlayerInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamCreateNestedOneWithoutPlayerInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  final _i1.PrismaUnion<_i2.TeamCreateWithoutPlayerInput,
      _i2.TeamUncheckedCreateWithoutPlayerInput>? create;

  final _i2.TeamCreateOrConnectWithoutPlayerInput? connectOrCreate;

  final _i2.TeamWhereUniqueInput? connect;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'connect': connect,
      };
}

class PlayerCreateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerCreateInput({
    required this.lastName,
    required this.firstName,
    required this.middleName,
    required this.jerseyNumber,
    required this.gamesPlayed,
    required this.team,
  });

  final String lastName;

  final String firstName;

  final String middleName;

  final int jerseyNumber;

  final int gamesPlayed;

  final _i2.TeamCreateNestedOneWithoutPlayerInput team;

  @override
  Map<String, dynamic> toJson() => {
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'team': team,
      };
}

class PlayerUncheckedCreateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerUncheckedCreateInput({
    this.id,
    required this.lastName,
    required this.firstName,
    required this.middleName,
    required this.jerseyNumber,
    required this.gamesPlayed,
    required this.teamID,
  });

  final int? id;

  final String lastName;

  final String firstName;

  final String middleName;

  final int jerseyNumber;

  final int gamesPlayed;

  final int teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
      };
}

class PlayerCreateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerCreateManyInput({
    this.id,
    required this.lastName,
    required this.firstName,
    required this.middleName,
    required this.jerseyNumber,
    required this.gamesPlayed,
    required this.teamID,
  });

  final int? id;

  final String lastName;

  final String firstName;

  final String middleName;

  final int jerseyNumber;

  final int gamesPlayed;

  final int teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
      };
}

class CreateManyPlayerAndReturnOutputTypeTeamArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const CreateManyPlayerAndReturnOutputTypeTeamArgs({
    this.select,
    this.include,
  });

  final _i2.TeamSelect? select;

  final _i2.TeamInclude? include;

  @override
  Map<String, dynamic> toJson() => {
        'select': select,
        'include': include,
      };
}

class CreateManyPlayerAndReturnOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const CreateManyPlayerAndReturnOutputTypeSelect({
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
    this.team,
  });

  final bool? id;

  final bool? lastName;

  final bool? firstName;

  final bool? middleName;

  final bool? jerseyNumber;

  final bool? gamesPlayed;

  final bool? teamID;

  final _i1.PrismaUnion<bool, _i2.CreateManyPlayerAndReturnOutputTypeTeamArgs>?
      team;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
        'team': team,
      };
}

class CreateManyPlayerAndReturnOutputTypeInclude
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const CreateManyPlayerAndReturnOutputTypeInclude({this.team});

  final _i1.PrismaUnion<bool, _i2.CreateManyPlayerAndReturnOutputTypeTeamArgs>?
      team;

  @override
  Map<String, dynamic> toJson() => {'team': team};
}

class TeamUpdateWithoutPlayerInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamUpdateWithoutPlayerInput({
    this.name,
    this.game,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? name;

  final _i2.GameUpdateManyWithoutTeamNestedInput? game;

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'Game': game,
      };
}

class TeamUncheckedUpdateWithoutPlayerInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamUncheckedUpdateWithoutPlayerInput({
    this.id,
    this.name,
    this.game,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? name;

  final _i2.GameUncheckedUpdateManyWithoutTeamNestedInput? game;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'Game': game,
      };
}

class TeamUpsertWithoutPlayerInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamUpsertWithoutPlayerInput({
    required this.update,
    required this.create,
    this.where,
  });

  final _i1.PrismaUnion<_i2.TeamUpdateWithoutPlayerInput,
      _i2.TeamUncheckedUpdateWithoutPlayerInput> update;

  final _i1.PrismaUnion<_i2.TeamCreateWithoutPlayerInput,
      _i2.TeamUncheckedCreateWithoutPlayerInput> create;

  final _i2.TeamWhereInput? where;

  @override
  Map<String, dynamic> toJson() => {
        'update': update,
        'create': create,
        'where': where,
      };
}

class TeamUpdateToOneWithWhereWithoutPlayerInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamUpdateToOneWithWhereWithoutPlayerInput({
    this.where,
    required this.data,
  });

  final _i2.TeamWhereInput? where;

  final _i1.PrismaUnion<_i2.TeamUpdateWithoutPlayerInput,
      _i2.TeamUncheckedUpdateWithoutPlayerInput> data;

  @override
  Map<String, dynamic> toJson() => {
        'where': where,
        'data': data,
      };
}

class TeamUpdateOneRequiredWithoutPlayerNestedInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const TeamUpdateOneRequiredWithoutPlayerNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.connect,
    this.update,
  });

  final _i1.PrismaUnion<_i2.TeamCreateWithoutPlayerInput,
      _i2.TeamUncheckedCreateWithoutPlayerInput>? create;

  final _i2.TeamCreateOrConnectWithoutPlayerInput? connectOrCreate;

  final _i2.TeamUpsertWithoutPlayerInput? upsert;

  final _i2.TeamWhereUniqueInput? connect;

  final _i1.PrismaUnion<
      _i2.TeamUpdateToOneWithWhereWithoutPlayerInput,
      _i1.PrismaUnion<_i2.TeamUpdateWithoutPlayerInput,
          _i2.TeamUncheckedUpdateWithoutPlayerInput>>? update;

  @override
  Map<String, dynamic> toJson() => {
        'create': create,
        'connectOrCreate': connectOrCreate,
        'upsert': upsert,
        'connect': connect,
        'update': update,
      };
}

class PlayerUpdateInput implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerUpdateInput({
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.team,
  });

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? lastName;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      firstName;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      middleName;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? jerseyNumber;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? gamesPlayed;

  final _i2.TeamUpdateOneRequiredWithoutPlayerNestedInput? team;

  @override
  Map<String, dynamic> toJson() => {
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'team': team,
      };
}

class PlayerUncheckedUpdateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerUncheckedUpdateInput({
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? lastName;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      firstName;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      middleName;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? jerseyNumber;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? gamesPlayed;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
      };
}

class PlayerUncheckedUpdateManyInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerUncheckedUpdateManyInput({
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
  });

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? id;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>? lastName;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      firstName;

  final _i1.PrismaUnion<String, _i2.StringFieldUpdateOperationsInput>?
      middleName;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? jerseyNumber;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? gamesPlayed;

  final _i1.PrismaUnion<int, _i2.IntFieldUpdateOperationsInput>? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
      };
}

class PlayerCountAggregateOutputType {
  const PlayerCountAggregateOutputType({
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
    this.$all,
  });

  factory PlayerCountAggregateOutputType.fromJson(Map json) =>
      PlayerCountAggregateOutputType(
        id: json['id'],
        lastName: json['lastName'],
        firstName: json['firstName'],
        middleName: json['middleName'],
        jerseyNumber: json['jerseyNumber'],
        gamesPlayed: json['gamesPlayed'],
        teamID: json['teamID'],
        $all: json['_all'],
      );

  final int? id;

  final int? lastName;

  final int? firstName;

  final int? middleName;

  final int? jerseyNumber;

  final int? gamesPlayed;

  final int? teamID;

  final int? $all;

  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
        '_all': $all,
      };
}

class PlayerAvgAggregateOutputType {
  const PlayerAvgAggregateOutputType({
    this.id,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
  });

  factory PlayerAvgAggregateOutputType.fromJson(Map json) =>
      PlayerAvgAggregateOutputType(
        id: json['id'],
        jerseyNumber: json['jerseyNumber'],
        gamesPlayed: json['gamesPlayed'],
        teamID: json['teamID'],
      );

  final double? id;

  final double? jerseyNumber;

  final double? gamesPlayed;

  final double? teamID;

  Map<String, dynamic> toJson() => {
        'id': id,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
      };
}

class PlayerSumAggregateOutputType {
  const PlayerSumAggregateOutputType({
    this.id,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
  });

  factory PlayerSumAggregateOutputType.fromJson(Map json) =>
      PlayerSumAggregateOutputType(
        id: json['id'],
        jerseyNumber: json['jerseyNumber'],
        gamesPlayed: json['gamesPlayed'],
        teamID: json['teamID'],
      );

  final int? id;

  final int? jerseyNumber;

  final int? gamesPlayed;

  final int? teamID;

  Map<String, dynamic> toJson() => {
        'id': id,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
      };
}

class PlayerMinAggregateOutputType {
  const PlayerMinAggregateOutputType({
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
  });

  factory PlayerMinAggregateOutputType.fromJson(Map json) =>
      PlayerMinAggregateOutputType(
        id: json['id'],
        lastName: json['lastName'],
        firstName: json['firstName'],
        middleName: json['middleName'],
        jerseyNumber: json['jerseyNumber'],
        gamesPlayed: json['gamesPlayed'],
        teamID: json['teamID'],
      );

  final int? id;

  final String? lastName;

  final String? firstName;

  final String? middleName;

  final int? jerseyNumber;

  final int? gamesPlayed;

  final int? teamID;

  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
      };
}

class PlayerMaxAggregateOutputType {
  const PlayerMaxAggregateOutputType({
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
  });

  factory PlayerMaxAggregateOutputType.fromJson(Map json) =>
      PlayerMaxAggregateOutputType(
        id: json['id'],
        lastName: json['lastName'],
        firstName: json['firstName'],
        middleName: json['middleName'],
        jerseyNumber: json['jerseyNumber'],
        gamesPlayed: json['gamesPlayed'],
        teamID: json['teamID'],
      );

  final int? id;

  final String? lastName;

  final String? firstName;

  final String? middleName;

  final int? jerseyNumber;

  final int? gamesPlayed;

  final int? teamID;

  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
      };
}

class PlayerGroupByOutputType {
  const PlayerGroupByOutputType({
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory PlayerGroupByOutputType.fromJson(Map json) => PlayerGroupByOutputType(
        id: json['id'],
        lastName: json['lastName'],
        firstName: json['firstName'],
        middleName: json['middleName'],
        jerseyNumber: json['jerseyNumber'],
        gamesPlayed: json['gamesPlayed'],
        teamID: json['teamID'],
        $count: json['_count'] is Map
            ? _i2.PlayerCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.PlayerAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.PlayerSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.PlayerMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.PlayerMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final int? id;

  final String? lastName;

  final String? firstName;

  final String? middleName;

  final int? jerseyNumber;

  final int? gamesPlayed;

  final int? teamID;

  final _i2.PlayerCountAggregateOutputType? $count;

  final _i2.PlayerAvgAggregateOutputType? $avg;

  final _i2.PlayerSumAggregateOutputType? $sum;

  final _i2.PlayerMinAggregateOutputType? $min;

  final _i2.PlayerMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
        '_count': $count?.toJson(),
        '_avg': $avg?.toJson(),
        '_sum': $sum?.toJson(),
        '_min': $min?.toJson(),
        '_max': $max?.toJson(),
      };
}

class PlayerCountOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerCountOrderByAggregateInput({
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? lastName;

  final _i2.SortOrder? firstName;

  final _i2.SortOrder? middleName;

  final _i2.SortOrder? jerseyNumber;

  final _i2.SortOrder? gamesPlayed;

  final _i2.SortOrder? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
      };
}

class PlayerAvgOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerAvgOrderByAggregateInput({
    this.id,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? jerseyNumber;

  final _i2.SortOrder? gamesPlayed;

  final _i2.SortOrder? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
      };
}

class PlayerMaxOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerMaxOrderByAggregateInput({
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? lastName;

  final _i2.SortOrder? firstName;

  final _i2.SortOrder? middleName;

  final _i2.SortOrder? jerseyNumber;

  final _i2.SortOrder? gamesPlayed;

  final _i2.SortOrder? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
      };
}

class PlayerMinOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerMinOrderByAggregateInput({
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? lastName;

  final _i2.SortOrder? firstName;

  final _i2.SortOrder? middleName;

  final _i2.SortOrder? jerseyNumber;

  final _i2.SortOrder? gamesPlayed;

  final _i2.SortOrder? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
      };
}

class PlayerSumOrderByAggregateInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerSumOrderByAggregateInput({
    this.id,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? jerseyNumber;

  final _i2.SortOrder? gamesPlayed;

  final _i2.SortOrder? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
      };
}

class PlayerOrderByWithAggregationInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerOrderByWithAggregationInput({
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  final _i2.SortOrder? id;

  final _i2.SortOrder? lastName;

  final _i2.SortOrder? firstName;

  final _i2.SortOrder? middleName;

  final _i2.SortOrder? jerseyNumber;

  final _i2.SortOrder? gamesPlayed;

  final _i2.SortOrder? teamID;

  final _i2.PlayerCountOrderByAggregateInput? $count;

  final _i2.PlayerAvgOrderByAggregateInput? $avg;

  final _i2.PlayerMaxOrderByAggregateInput? $max;

  final _i2.PlayerMinOrderByAggregateInput? $min;

  final _i2.PlayerSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
        '_count': $count,
        '_avg': $avg,
        '_max': $max,
        '_min': $min,
        '_sum': $sum,
      };
}

class PlayerScalarWhereWithAggregatesInput
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
  });

  final _i1.PrismaUnion<_i2.PlayerScalarWhereWithAggregatesInput,
      Iterable<_i2.PlayerScalarWhereWithAggregatesInput>>? AND;

  final Iterable<_i2.PlayerScalarWhereWithAggregatesInput>? OR;

  final _i1.PrismaUnion<_i2.PlayerScalarWhereWithAggregatesInput,
      Iterable<_i2.PlayerScalarWhereWithAggregatesInput>>? NOT;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? id;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? lastName;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? firstName;

  final _i1.PrismaUnion<_i2.StringWithAggregatesFilter, String>? middleName;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? jerseyNumber;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? gamesPlayed;

  final _i1.PrismaUnion<_i2.IntWithAggregatesFilter, int>? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'AND': AND,
        'OR': OR,
        'NOT': NOT,
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
      };
}

class PlayerCountAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerCountAggregateOutputTypeSelect({
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
    this.$all,
  });

  final bool? id;

  final bool? lastName;

  final bool? firstName;

  final bool? middleName;

  final bool? jerseyNumber;

  final bool? gamesPlayed;

  final bool? teamID;

  final bool? $all;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
        '_all': $all,
      };
}

class PlayerGroupByOutputTypeCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerGroupByOutputTypeCountArgs({this.select});

  final _i2.PlayerCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class PlayerAvgAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerAvgAggregateOutputTypeSelect({
    this.id,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
  });

  final bool? id;

  final bool? jerseyNumber;

  final bool? gamesPlayed;

  final bool? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
      };
}

class PlayerGroupByOutputTypeAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerGroupByOutputTypeAvgArgs({this.select});

  final _i2.PlayerAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class PlayerSumAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerSumAggregateOutputTypeSelect({
    this.id,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
  });

  final bool? id;

  final bool? jerseyNumber;

  final bool? gamesPlayed;

  final bool? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
      };
}

class PlayerGroupByOutputTypeSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerGroupByOutputTypeSumArgs({this.select});

  final _i2.PlayerSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class PlayerMinAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerMinAggregateOutputTypeSelect({
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
  });

  final bool? id;

  final bool? lastName;

  final bool? firstName;

  final bool? middleName;

  final bool? jerseyNumber;

  final bool? gamesPlayed;

  final bool? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
      };
}

class PlayerGroupByOutputTypeMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerGroupByOutputTypeMinArgs({this.select});

  final _i2.PlayerMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class PlayerMaxAggregateOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerMaxAggregateOutputTypeSelect({
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
  });

  final bool? id;

  final bool? lastName;

  final bool? firstName;

  final bool? middleName;

  final bool? jerseyNumber;

  final bool? gamesPlayed;

  final bool? teamID;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
      };
}

class PlayerGroupByOutputTypeMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerGroupByOutputTypeMaxArgs({this.select});

  final _i2.PlayerMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class PlayerGroupByOutputTypeSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const PlayerGroupByOutputTypeSelect({
    this.id,
    this.lastName,
    this.firstName,
    this.middleName,
    this.jerseyNumber,
    this.gamesPlayed,
    this.teamID,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final bool? id;

  final bool? lastName;

  final bool? firstName;

  final bool? middleName;

  final bool? jerseyNumber;

  final bool? gamesPlayed;

  final bool? teamID;

  final _i1.PrismaUnion<bool, _i2.PlayerGroupByOutputTypeCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.PlayerGroupByOutputTypeAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.PlayerGroupByOutputTypeSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.PlayerGroupByOutputTypeMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.PlayerGroupByOutputTypeMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'middleName': middleName,
        'jerseyNumber': jerseyNumber,
        'gamesPlayed': gamesPlayed,
        'teamID': teamID,
        '_count': $count,
        '_avg': $avg,
        '_sum': $sum,
        '_min': $min,
        '_max': $max,
      };
}

class AggregatePlayer {
  const AggregatePlayer({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory AggregatePlayer.fromJson(Map json) => AggregatePlayer(
        $count: json['_count'] is Map
            ? _i2.PlayerCountAggregateOutputType.fromJson(json['_count'])
            : null,
        $avg: json['_avg'] is Map
            ? _i2.PlayerAvgAggregateOutputType.fromJson(json['_avg'])
            : null,
        $sum: json['_sum'] is Map
            ? _i2.PlayerSumAggregateOutputType.fromJson(json['_sum'])
            : null,
        $min: json['_min'] is Map
            ? _i2.PlayerMinAggregateOutputType.fromJson(json['_min'])
            : null,
        $max: json['_max'] is Map
            ? _i2.PlayerMaxAggregateOutputType.fromJson(json['_max'])
            : null,
      );

  final _i2.PlayerCountAggregateOutputType? $count;

  final _i2.PlayerAvgAggregateOutputType? $avg;

  final _i2.PlayerSumAggregateOutputType? $sum;

  final _i2.PlayerMinAggregateOutputType? $min;

  final _i2.PlayerMaxAggregateOutputType? $max;

  Map<String, dynamic> toJson() => {
        '_count': $count?.toJson(),
        '_avg': $avg?.toJson(),
        '_sum': $sum?.toJson(),
        '_min': $min?.toJson(),
        '_max': $max?.toJson(),
      };
}

class AggregatePlayerCountArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregatePlayerCountArgs({this.select});

  final _i2.PlayerCountAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregatePlayerAvgArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregatePlayerAvgArgs({this.select});

  final _i2.PlayerAvgAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregatePlayerSumArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregatePlayerSumArgs({this.select});

  final _i2.PlayerSumAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregatePlayerMinArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregatePlayerMinArgs({this.select});

  final _i2.PlayerMinAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregatePlayerMaxArgs
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregatePlayerMaxArgs({this.select});

  final _i2.PlayerMaxAggregateOutputTypeSelect? select;

  @override
  Map<String, dynamic> toJson() => {'select': select};
}

class AggregatePlayerSelect
    implements _i1.JsonConvertible<Map<String, dynamic>> {
  const AggregatePlayerSelect({
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  final _i1.PrismaUnion<bool, _i2.AggregatePlayerCountArgs>? $count;

  final _i1.PrismaUnion<bool, _i2.AggregatePlayerAvgArgs>? $avg;

  final _i1.PrismaUnion<bool, _i2.AggregatePlayerSumArgs>? $sum;

  final _i1.PrismaUnion<bool, _i2.AggregatePlayerMinArgs>? $min;

  final _i1.PrismaUnion<bool, _i2.AggregatePlayerMaxArgs>? $max;

  @override
  Map<String, dynamic> toJson() => {
        '_count': $count,
        '_avg': $avg,
        '_sum': $sum,
        '_min': $min,
        '_max': $max,
      };
}
