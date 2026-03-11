class CachedItem {
  final dynamic data;
  final DateTime createdAt;

  CachedItem(this.data)
      : createdAt = DateTime.now();
}
