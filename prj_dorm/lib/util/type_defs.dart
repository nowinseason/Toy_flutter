import 'package:fpdart/fpdart.dart';
import 'package:prj_dorm/util/failure.dart';

// error handling !! after MVP
typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;
