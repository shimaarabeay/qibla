import 'package:dartz/dartz.dart';
import 'package:qibla/core/data/network/failure.dart';

abstract class StreamBaseUseCase<In, Out> {
  Stream<Either<Failure, Out>> execute(In input);
}
