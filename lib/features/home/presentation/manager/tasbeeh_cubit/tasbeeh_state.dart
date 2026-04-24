enum TasbeehStatus { initial, updated }
enum TasbeehType {
  subhanAllah,
  alhamdulillah,
  allahuAkbar,
  laIlahaIllaAllah,
}
class TasbeehState {
  final TasbeehType type;
  final int count;
  final TasbeehStatus status;

  const TasbeehState({
    required this.type,
    required this.count,
    required this.status,
  });

  factory TasbeehState.initial() {
    return const TasbeehState(
      type: TasbeehType.subhanAllah,
      count: 0,
      status: TasbeehStatus.initial,
    );
  }

  TasbeehState copyWith({
    TasbeehType? type,
    int? count,
    TasbeehStatus? status,
  }) {
    return TasbeehState(
      type: type ?? this.type,
      count: count ?? this.count,
      status: status ?? this.status,
    );
  }
}
extension TasbeehTypeExtension on TasbeehType {
  String get displayName {
    switch (this) {
      case TasbeehType.subhanAllah:
        return "سبحان الله";
      case TasbeehType.alhamdulillah:
        return "الحمد لله";
      case TasbeehType.allahuAkbar:
        return "الله أكبر";
      case TasbeehType.laIlahaIllaAllah:
        return "لا إله إلا الله";
    }
  }
}