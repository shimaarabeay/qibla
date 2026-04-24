class TasbeehEntity {
  final String zekr;
  final int count;

  TasbeehEntity({
    required this.zekr,
    required this.count,
  });

  TasbeehEntity copyWith({
    String? zekr,
    int? count,
  }) {
    return TasbeehEntity(
      zekr: zekr ?? this.zekr,
      count: count ?? this.count,
    );
  }
}