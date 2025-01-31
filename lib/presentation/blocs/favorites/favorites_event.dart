import 'package:equatable/equatable.dart';

abstract class FavoritesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadFavoritesEvent extends FavoritesEvent {}

class RemoveFavoriteEvent extends FavoritesEvent {
  final String city;
  RemoveFavoriteEvent(this.city);

  @override
  List<Object?> get props => [city];
}
