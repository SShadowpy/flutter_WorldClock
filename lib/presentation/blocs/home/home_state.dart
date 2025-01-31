import 'package:equatable/equatable.dart';
import '../../../../domain/entities/world_time.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final WorldTime worldTime;

  HomeLoaded(this.worldTime);

  @override
  List<Object?> get props => [worldTime];
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
