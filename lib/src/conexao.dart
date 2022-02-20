import 'package:postgres/postgres.dart';

Future<void> call() async {
  final connection = PostgreSQLConnection("10.0.2.2", 5432, "db_clientes",
      username: "postgres", password: "123");
  await connection.open();

  List<Map<String, Map<String, dynamic>>> results =
      await connection.mappedResultsQuery("SELECT * FROM cliente");

  for (final row in results) {
    print(row);
  }

  await connection.close();
}
