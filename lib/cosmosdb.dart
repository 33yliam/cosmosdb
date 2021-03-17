library cosmosdb;

import 'package:cosmosdb/api/database_api.dart';
import 'package:cosmosdb/api/documents_api.dart';
import 'package:cosmosdb/cosmosdb_http_client.dart';

export 'model/query.dart';

class CosmosDB {
  final CosmosDBHttpClient _client;

  DocumentApi get documents => DocumentApi(_client);
  DatabaseApi get databases => DatabaseApi(_client);

  CosmosDB({required masterKey, required baseUrl})
      : _client = CosmosDBHttpClient(masterKey: masterKey, baseUrl: baseUrl);
}