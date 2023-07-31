part of 'generator_cubit.dart';

class GeneratorState extends Equatable {
  const GeneratorState({
    required this.current,
    this.favorites = const <WordPair>[],
  });

  final WordPair current;
  final List<WordPair> favorites;

  @override
  List<Object> get props => [current, favorites];

  GeneratorState copyWith({
    WordPair? current,
    List<WordPair>? favorites,
  }) {
    return GeneratorState(
      current: current ?? this.current,
      favorites: favorites ?? this.favorites,
    );
  }
}
