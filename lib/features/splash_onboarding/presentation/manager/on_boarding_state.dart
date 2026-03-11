part of 'on_boarding_cubit.dart';

enum OnBoardingStatus {
  initial,
  next,
}

extension OnBoardingStatusExtension on OnBoardingStatus {
  bool get isInitial => this == OnBoardingStatus.initial;
  bool get isNext => this == OnBoardingStatus.next;
}

@immutable
class OnBoardingState {
  final int currentIndex;
  final OnBoardingStatus status;
  final bool isLastPage;

  const OnBoardingState({
    this.currentIndex = 0,
    this.isLastPage = false,
    this.status = OnBoardingStatus.initial,
  });

  OnBoardingState copyWith({
    int? currentIndex,
    OnBoardingStatus? status,
    bool? isLastPage,
  }) {
    return OnBoardingState(
      currentIndex: currentIndex ?? this.currentIndex,
      status: status ?? this.status,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }
}
