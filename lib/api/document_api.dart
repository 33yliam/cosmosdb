import 'package:cosmosdb/cosmosdb_http_client.dart';
import 'package:cosmosdb/model/query.dart';
import 'package:cosmosdb/model/request_options.dart';
import 'package:cosmosdb/model/resource_type.dart';

class DocumentApi {
  final CosmosDBHttpClient _client;

  const DocumentApi(this._client);

  Future<Iterable<dynamic>> list(String databaseId, String collectionId,
      {CosmosRequestOptions? options}) async {
    final result = await _client.get(
      'dbs/$databaseId/colls/$collectionId/docs',
      resourceType: ResourceType.item,
      removeLastPart: true,
      headers: options?.toHeaders() ?? const {},
    );
    return result['Documents'];
  }

  Future<Iterable<dynamic>> query(
      Query query, String databaseId, String collectionId,
      {CosmosRequestOptions? options}) async {
    final result = await _client.post(
      'dbs/$databaseId/colls/$collectionId/docs',
      query.toMap(),
      resourceType: ResourceType.item,
      removeLastPart: true,
      headers: options?.toHeaders() ?? const {},
    );
    return result['Documents'];
  }

  Future<Map<String, dynamic>> replace(Map<String, dynamic> newDocument,
      String databaseId, String collectionId, String documentId,
      {CosmosRequestOptions? options}) {
    return _client.put(
      'dbs/$databaseId/colls/$collectionId/docs/$documentId',
      newDocument,
      resourceType: ResourceType.item,
      removeLastPart: false,
      headers: options?.toHeaders() ?? const {},
    );
  }

  Future<void> delete(String databaseId, String collectionId, String documentId,
      {CosmosRequestOptions? options}) async {
    await _client.delete(
      'dbs/$databaseId/colls/$collectionId/docs/$documentId',
      resourceType: ResourceType.item,
      removeLastPart: false,
      headers: options?.toHeaders() ?? const {},
    );
  }

  Future<Map<String, dynamic>> findById(
      String databaseId, String collectionId, String documentId,
      {CosmosRequestOptions? options}) async {
    return await _client.get(
      'dbs/$databaseId/colls/$collectionId/docs/$documentId',
      resourceType: ResourceType.item,
      removeLastPart: false,
      headers: options?.toHeaders() ?? const {},
    );
  }
}
