abstract class HiveService<T> {
  Future<void> openBox({required String boxName});

  Future<void> addItem({
    required String boxName,
    required T item,
  });

  Future<void> addAll({
    required String boxName,
    required List<T> items,
  });

  List<T> getAll({
    required String boxName,
  });

  T? getItem({
    required String boxName,
    required dynamic key,
  });

  Future<void> putItem({
    required String boxName,
    required dynamic key,
    required T item,
  });

  Future<void> deleteItem({
    required String boxName,
    required dynamic key,
  });

  Future<void> clearBox({
    required String boxName,
  });

  bool containsKey({
    required String boxName,
    required dynamic key,
  });

  Future<void> closeBox(String boxName);
}
// class HiveService {
//   late Box surahBox;
//   late Box audioBox;
//
//   /// تهيئة الـ Boxes قبل أي استخدام
//   Future<void> init() async {
//     surahBox = await Hive.openBox('surahsBox');
//     audioBox = await Hive.openBox('audioBox');
//   }
//
//   /// حفظ بيانات السور
//   Future<void> saveSurahs(List<Map<String, dynamic>> data) async {
//     await surahBox.put('surahs', data);
//   }
//
//   /// جلب بيانات السور
//   List<Map<String, dynamic>> getSurahs() {
//     final data = surahBox.get('surahs', defaultValue: []);
//     return List<Map<String, dynamic>>.from(data);
//   }
//
//   /// حفظ صوت السورة
//   Future<void> saveAudio(String surahId, List<int> bytes) async {
//     await audioBox.put(surahId, bytes);
//   }
//
//   /// جلب صوت السورة
//   List<int>? getAudio(String surahId) {
//     return audioBox.get(surahId);
//   }
//
//   /// التأكد من وجود الصوت
//   bool hasAudio(String surahId) {
//     return audioBox.containsKey(surahId);
//   }
// }
