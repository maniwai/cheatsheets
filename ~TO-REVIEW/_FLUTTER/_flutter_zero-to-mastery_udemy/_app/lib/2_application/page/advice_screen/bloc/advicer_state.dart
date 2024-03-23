part of 'advicer_bloc.dart';

@immutable
abstract class AdvicerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AdvicerInitial extends AdvicerState {}

class AdvicerStateLoading extends AdvicerState {}

class AdvicerStateLoaded extends AdvicerState {
  AdvicerStateLoaded({required this.advice});

  final String advice;

  @override
  List<Object?> get props => [advice];
}

class AdvicerStateError extends AdvicerState {
  AdvicerStateError({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
