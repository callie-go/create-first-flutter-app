import 'package:bloc/bloc.dart';
import 'package:english_words/english_words.dart';
import 'package:equatable/equatable.dart';

part 'generator_state.dart';

class GeneratorCubit extends Cubit<GeneratorState> {
  GeneratorCubit() : super(GeneratorState(current: WordPair.random()));

  void onToggleFavorite(WordPair wordPair) {
    final currentFavorites = state.favorites.map((e) => e).toList();
    if (currentFavorites.contains(wordPair)) {
      currentFavorites.remove(wordPair);
    } else {
      currentFavorites.add(wordPair);
    }
    emit(state.copyWith(favorites: currentFavorites.map((e) => e).toList()));
  }

  void onGetNext() {
    emit(state.copyWith(current: WordPair.random()));
  }
}
