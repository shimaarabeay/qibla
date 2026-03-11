class BasicModel {
  BasicModel({
    required this.returnValue,
    required this.message,
    this.threadId,
  });

  final int returnValue;
  final String message;
  final num? threadId;
}
