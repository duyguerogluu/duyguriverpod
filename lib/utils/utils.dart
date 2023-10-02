// extension to prevent key not found exceptions
extension MapExtension on Map {
  dynamic get(String key, [dynamic def]) {
    return containsKey(key) ? this[key] : def;
  }
}
