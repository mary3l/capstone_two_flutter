import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:orm_flutter/orm_flutter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:audio_classification/prisma/generated_dart_client/client.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

late final PrismaClient prisma;

/* Future<void> initPrismaClient() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(); // Load .env file
  final directory = await getApplicationDocumentsDirectory();
  final dbPath = '${directory.path}/basketball_stats.db';

  final dbUrl =
      dotenv.env['DATABASE_URL']?.replaceFirst('PLACEHOLDER_PATH', dbPath);
  final prisma = PrismaClient();
  final engine = prisma.$engine as LibraryEngine;

  await engine.applyMigrations(
    path:
        'prisma/migrations/', // You define in `flutter.assets` migrations root dir
  );

  await prisma.$connect();
  log('prisasdasdma ${prisma}');
}
 */

Future<void> initPrismaClient() async {
  WidgetsFlutterBinding.ensureInitialized();

  final supportDir = await getApplicationSupportDirectory();
  final database =
      '/data/data/org.tensorflow.audio_classification.audio_classification/databases/basketball_stats.db';
  //await dotenv.load(); // Ensure dotenv is loaded first
  //final databaseUrl = dotenv.env['DATABASE_URL']!;
  prisma = PrismaClient(datasourceUrl: 'file:${database}');
  final engine = switch (prisma.$engine) {
    LibraryEngine engine => engine,
    _ => null,
  };

  await prisma.$connect();
  await engine?.applyMigrations(path: 'lib/prisma/migrations');

  print('migrations?');
}
