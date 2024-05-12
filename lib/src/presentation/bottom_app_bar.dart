import 'package:flutter/material.dart';

class BuildBottomAppBar extends StatelessWidget {
  const BuildBottomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              // Implemente a ação para a tela inicial
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implemente a ação para a tela de pesquisa
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              // Implemente a ação para a tela de perfil
            },
          ),
        ],
      ),
    );
  }
}

