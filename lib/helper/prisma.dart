import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:orm_flutter/orm_flutter.dart';

import 'package:audio_classification/prisma/generated_dart_client/client.dart';

late final PrismaClient prisma;

Future<void> initPrismaClient() async {
  WidgetsFlutterBinding.ensureInitialized();
  const database =
      '/data/data/org.tensorflow.audio_classification.audio_classification/databases/basketball_stats.db';

  prisma = PrismaClient(datasourceUrl: 'file:${database}');
  final engine = switch (prisma.$engine) {
    LibraryEngine engine => engine,
    _ => null,
  };

  await prisma.$connect();
  await engine?.applyMigrations(path: 'lib/prisma/migrations');
  log('Applied migrations');
}
