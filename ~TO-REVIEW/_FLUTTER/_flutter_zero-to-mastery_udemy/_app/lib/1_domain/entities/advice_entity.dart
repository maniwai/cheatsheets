import 'package:equatable/equatable.dart';

class AdviceEntity extends Equatable {
  const AdviceEntity({required this.id, required this.value});

  final int id;
  final String value;

  @override
  List<Object?> get props => [id, value];
}
