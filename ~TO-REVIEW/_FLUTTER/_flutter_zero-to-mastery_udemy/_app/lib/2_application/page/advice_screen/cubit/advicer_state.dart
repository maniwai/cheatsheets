part of 'advicer_cubit.dart';

abstract class AdvicerCubitState  extends Equatable {
  const AdvicerCubitState();

  @override
  List<Object?> get props => [];
}

class AdvicerInitial extends AdvicerCubitState {}

class AdvicerStateLoading extends AdvicerCubitState {}

class AdvicerStateLoaded extends AdvicerCubitState {
  const AdvicerStateLoaded({required this.advice});

  final String advice;

  @override
  List<Object?> get props => [advice];
}

class AdvicerStateError extends AdvicerCubitState {
  const AdvicerStateError({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

