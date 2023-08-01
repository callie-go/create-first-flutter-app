import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/generator_cubit.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneratorCubit, GeneratorState>(
      builder: (context, state) {
        if (state.favorites.isEmpty) {
          return const Center(
            child: Text("Favorite is empty"),
          );
        } else {
          return ListView.builder(
            itemCount: state.favorites.length,
            itemBuilder: (context, index) {
              final wordPair = state.favorites[index];
              return ListTile(
                title: Text(wordPair.asLowerCase),
                leading: IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                    context.read<GeneratorCubit>().onToggleFavorite(wordPair);
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}
