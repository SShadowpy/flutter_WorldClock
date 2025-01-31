import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchWorldTimeEvent extends HomeEvent {
  final String city;

  FetchWorldTimeEvent(this.city);

  @override
  List<Object?> get props => [city];
}

class AddToFavoritesEvent extends HomeEvent {
  final String city;

  AddToFavoritesEvent(this.city);

  @override
  List<Object?> get props => [city];
}
