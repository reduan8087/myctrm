import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN GET LOCATIONS
Future<List<GetLocationsRow>> performGetLocations(
  Database database,
) {
  const query = '''
SELECT *  Location FROM ctrm;
''';
  return _readQuery(database, query, (d) => GetLocationsRow(d));
}

class GetLocationsRow extends SqliteRow {
  GetLocationsRow(super.data);

  String get location => data['Location'] as String;
}

/// END GET LOCATIONS
