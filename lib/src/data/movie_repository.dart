import 'movie_item.dart';

class MovieRepository {
  List<MovieItem> _movies = [];

  MovieRepository() {
    _initMovies();
  }

  void _initMovies() {
    _movies = [
      MovieItem(
          id: 1,
          title: 'Godzilla Minus One',
          posterPath: 'assets/images/godzilla.jpg',
          synopsis:
              'O filme se passa em Japão social e economicamente devastado após o término da Segunda Guerra Mundial, na qual o país saiu perdendo. A situação chega a um nível ainda mais crítico quando uma gigantesca e misteriosa criatura surge do mar para assolar o país, o temível kaiju. Sob esse pano de fundo, sentindo-se como se tivesse enganado a morte muitas vezes, está Kōichi Shikishima (Ryunosuke Kamiki), um piloto Kamikaze. E quando seu grupo é atacado na Ilha Odo, com muitos mortos pelo monstro gigantesco, uma enorme culpa pesa sobre Shikishima, agora sobrevivente. Entrando assim, em uma missão pessoal, para defender suas pessoas queridas e vingar a morte de seus companheiros, Shikishima se une a um grande grupo de veteranos de Guerra, para finalmente derrotar o monstro conhecido como Godzilla.',
          isFavorite: false,
          duration: 125,
          year: 2023),
      MovieItem(
          id: 2,
          title: 'Pulp Fiction',
          posterPath: 'assets/images/pulp-fiction.jpg',
          synopsis:
              'Assassino que trabalha para a máfia se apaixona pela esposa de seu chefe quando é convidado a acompanhá-la, um boxeador descumpre sua promessa de perder uma luta e um casal tenta um assalto que rapidamente sai do controle.',
          isFavorite: false,
          duration: 154,
          year: 1995),
      MovieItem(
          id: 3,
          title: "Kung Fu Panda 4",
          posterPath: 'assets/images/kungfu-panda.jpg',
          synopsis:
              'Po está prestes a tornar-se o novo líder espiritual do Vale da Paz, mas antes disso, ele deve encontrar um sucessor para se tornar o novo Guerreiro Dragão. Parece que ele encontra um em Zhen, uma raposa com muitas habilidades promissoras, mas que não gosta muito da ideia de Po treiná-lo.',
          isFavorite: false,
          duration: 94,
          year: 2024)
    ];
  }

  List<MovieItem> moviesList() {
    return List.unmodifiable(_movies);
  }

  void toggleFavorite(int id) {
    _movies.firstWhere((movie) => movie.id == id).isFavorite = !_movies.firstWhere((movie) => movie.id == id).isFavorite;
  }
}
