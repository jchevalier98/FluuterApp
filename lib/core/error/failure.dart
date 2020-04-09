import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class GeneralFailure implements Failure {
  List<Object> get props => null;

  @override
  bool get stringify => false;
}
