import 'package:postgres/postgres.dart';

final connection = PostgreSQLConnection("10.0.2.2", 5432, "db_clientes",
      username: "postgres", password: "123");

Future<void> select() async {

  await connection.open();

  List<Map<String, Map<String, dynamic>>> results =
      await connection.mappedResultsQuery("SELECT * FROM cliente");

  for (final row in results) {
    print(row);
  }

  await connection.close();
}

Future<void> insert(username, senha) async {
  final connection = PostgreSQLConnection("10.0.2.2", 5432, "db_clientes",
      username: "postgres", password: "123");

  await connection.open();

  connection.execute(
      "INSERT INTO public.cliente(cod_cli, username, senha)VALUES (default, $username, $senha);");

  await connection.close();
}

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
