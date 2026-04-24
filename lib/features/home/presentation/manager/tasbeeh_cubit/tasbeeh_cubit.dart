import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qibla/features/home/presentation/manager/tasbeeh_cubit/tasbeeh_state.dart';

class TasbeehCubit extends Cubit<TasbeehState> {
  TasbeehCubit() : super(TasbeehState.initial());

  void changeTasbeeh(TasbeehType type) {
    emit(
      state.copyWith(
        type: type,
        count: 0, // reset
        status: TasbeehStatus.updated,
      ),
    );
  }
  void increment() {
    emit(
      state.copyWith(
        count: state.count + 1,
        status: TasbeehStatus.updated,
      ),
    );
  }
  void reset() {
    emit(
      state.copyWith(
        count: 0,
        status: TasbeehStatus.updated,
      ),
    );
  }
}