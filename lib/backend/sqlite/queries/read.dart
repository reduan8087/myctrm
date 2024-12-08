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
SELECT DISTINCT Location FROM ctrm;
''';
  return _readQuery(database, query, (d) => GetLocationsRow(d));
}

class GetLocationsRow extends SqliteRow {
  GetLocationsRow(super.data);
}

/// END GET LOCATIONS

/// BEGIN GET DATA BY LOCATION
Future<List<GetDataByLocationRow>> performGetDataByLocation(
  Database database,
) {
  const query = '''
SELECT * FROM ctrm WHERE Location = ?;
''';
  return _readQuery(database, query, (d) => GetDataByLocationRow(d));
}

class GetDataByLocationRow extends SqliteRow {
  GetDataByLocationRow(super.data);
}

/// END GET DATA BY LOCATION
