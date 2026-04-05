import 'package:hive/hive.dart';

import 'hive_service.dart';

class HiveServiceImpl<T> implements HiveService<T> {
  final Map<String, Box<T>> _boxes = {};

  Future<Box<T>> _getBox(String boxName) async {
    if (_boxes.containsKey(boxName)) {
      return _boxes[boxName]!;
    }

    final box = await Hive.openBox<T>(boxName);
    _boxes[boxName] = box;
    return box;
  }

  @override
  Future<void> openBox({required String boxName}) async {
    await _getBox(boxName);
  }

  @override
  Future<void> addItem({
    required String boxName,
    required T item,
  }) async {
    final box = await _getBox(boxName);
    await box.add(item);
  }

  @override
  Future<void> addAll({
    required String boxName,
    required List<T> items,
  }) async {
    final box = await _getBox(boxName);
    await box.addAll(items);
  }

  @override
  List<T> getAll({
    required String boxName,
  }) {
    final box = _boxes[boxName];
    if (box == null) return [];
    return box.values.toList();
  }

  @override
  T? getItem({
    required String boxName,
    required dynamic key,
  }) {
    final box = _boxes[boxName];
    return box?.get(key);
  }

  @override
  Future<void> putItem({
    required String boxName,
    required dynamic key,
    required T item,
  }) async {
    final box = await _getBox(boxName);
    await box.put(key, item);
  }

  @override
  Future<void> deleteItem({
    required String boxName,
    required dynamic key,
  }) async {
    final box = await _getBox(boxName);
    await box.delete(key);
  }

  @override
  Future<void> clearBox({
    required String boxName,
  }) async {
    final box = await _getBox(boxName);
    await box.clear();
  }

  @override
  bool containsKey({
    required String boxName,
    required dynamic key,
  }) {
    final box = _boxes[boxName];
    return box?.containsKey(key) ?? false;
  }

  @override
  Future<void> closeBox(String boxName) async {
    final box = _boxes[boxName];
    await box?.close();
    _boxes.remove(boxName);
  }
}