class CosmosOperationsOptions{
  /// operation to perform - add, remove, set, incr, move, replace
final String? op;

/// path to field to perform the operation /fieldname
final String? path;

/// the new field value (not applicable to remove and move)
final value;

/// the current path of the field (used with operation 'move' to change field path)
final String? from;


final String? replace;

CosmosOperationsOptions({this.op, this.path, this.value, this.from, this.replace});

Map<String,dynamic> toJSON() => {
  if (op != null)
    'op': op,
  if (replace != null)
    'replace': replace,
  if (path != null)
    'path': path,
  if (value != null)
    'value': value,
  if (from != null)
    'from': from,
};
}