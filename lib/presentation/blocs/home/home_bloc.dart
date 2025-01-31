import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pj1/domain/repositories/world_time_repository.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final WorldTimeRepository repository;

  HomeBloc(this.repository) : super(HomeInitial()) {
    on<FetchWorldTimeEvent>(_onFetchWorldTime);
    on<AddToFavoritesEvent>(_onAddToFavorites);
  }

  Future<void> _onFetchWorldTime(
    FetchWorldTimeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    try {
      final worldTime = await repository.getWorldTime(event.city);
      emit(HomeLoaded(worldTime));
    } catch (e) {
      emit(HomeError('Failed to fetch world time: $e'));
    }
  }

  Future<void> _onAddToFavorites(
    AddToFavoritesEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      await repository.addFavorite(event.city);
      // You might want to show a message or do something else here
    } catch (e) {
      emit(HomeError('Failed to add favorite: $e'));
    }
  }
}
