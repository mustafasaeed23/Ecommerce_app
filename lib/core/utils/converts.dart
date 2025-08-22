// Common, safe converters for parsing API payloads.

/// Always returns a String (uses toString on non-null values).
String asString(dynamic v, {String fallback = ''}) {
  if (v == null) return fallback;
  return v.toString();
}

/// Nullable String (null stays null, otherwise toString).
String? asStringN(dynamic v) => v == null ? null : v.toString();

/// Safe int parsing for metadata/counters (not used in CategoryModel fields).
int asInt(dynamic v, {int fallback = 0}) {
  if (v is int) return v;
  if (v is String) return int.tryParse(v) ?? fallback;
  return fallback;
}
