import 'movie_item.dart';

class MovieRepository {
  List<MovieItem> _action = [];
  List<MovieItem> _anims = [];
  List<MovieItem> _drama = [];
  List<MovieItem> _crime = [];
  List<MovieItem> _comedy = [];
  List<MovieItem> _scifi = [];

  MovieRepository() {
    _initMovies();
  }

  void _initMovies() {
    _action = [
      MovieItem(
          id: 1,
          title: 'Godzilla Minus One',
          posterPath: 'assets/images/godzilla.jpg',
          synopsis:
              'O filme se passa em Japão social e economicamente devastado após o término da Segunda Guerra Mundial, na qual o país saiu perdendo. A situação chega a um nível ainda mais crítico quando uma gigantesca e misteriosa criatura surge do mar para assolar o país, o temível kaiju. Sob esse pano de fundo, sentindo-se como se tivesse enganado a morte muitas vezes, está Kōichi Shikishima (Ryunosuke Kamiki), um piloto Kamikaze. E quando seu grupo é atacado na Ilha Odo, com muitos mortos pelo monstro gigantesco, uma enorme culpa pesa sobre Shikishima, agora sobrevivente. Entrando assim, em uma missão pessoal, para defender suas pessoas queridas e vingar a morte de seus companheiros, Shikishima se une a um grande grupo de veteranos de Guerra, para finalmente derrotar o monstro conhecido como Godzilla.',
          isFavorite: false,
          duration: 125,
          year: 2023,
          category: "Ação/Ficção"),
      MovieItem(
          id: 2,
          title: 'Pulp Fiction',
          posterPath: 'assets/images/pulp-fiction.jpg',
          synopsis:
              'Assassino que trabalha para a máfia se apaixona pela esposa de seu chefe quando é convidado a acompanhá-la, um boxeador descumpre sua promessa de perder uma luta e um casal tenta um assalto que rapidamente sai do controle.',
          isFavorite: false,
          duration: 154,
          year: 1995,
          category: "Crime/Thriller"),
      MovieItem(
          id: 3,
          title: "Kung Fu Panda 4",
          posterPath: 'assets/images/kungfu-panda.jpg',
          synopsis:
              'Po está prestes a tornar-se o novo líder espiritual do Vale da Paz, mas antes disso, ele deve encontrar um sucessor para se tornar o novo Guerreiro Dragão. Parece que ele encontra um em Zhen, uma raposa com muitas habilidades promissoras, mas que não gosta muito da ideia de Po treiná-lo.',
          isFavorite: false,
          duration: 94,
          year: 2024,
          category: "Comédia/Aventura"),
      MovieItem(
          id: 5,
          title: "Maze Runner - Correr Ou Morrer",
          posterPath: 'assets/images/maze-runner-correr-ou-morrer.jpg',
          synopsis:
              'Em um futuro apocalíptico, o jovem Thomas é escolhido para enfrentar o sistema. Ele acorda dentro de um escuro elevador em movimento e não consegue se lembrar nem de seu nome. Na comunidade isolada em que foi abandonado, Thomas conhece outros garotos que passaram pela mesma situação. Para conseguir escapar, ele precisa descobrir os sombrios segredos guardados em sua mente e correr muito.',
          isFavorite: false,
          duration: 113,
          year: 2014,
          category: "Ficção científica/Ação"),
      MovieItem(
          id: 6,
          title: "Maze Runner: Provas de Fogo",
          posterPath: 'assets/images/maze-runner-prova-de-fogo.jpg',
          synopsis:
              'Depois de escapar do labirinto, Thomas e os garotos que o acompanharam em sua fuga encontram uma realidade bem diferente: a superfície da Terra foi queimada pelo Sol e eles precisam lidar com criaturas disformes chamadas Cranks.',
          isFavorite: false,
          duration: 133,
          year: 2015,
          category: "Ficção científica/Ação"),
      MovieItem(
          id: 7,
          title: "Maze Runner: A Cura Mortal",
          posterPath: 'assets/images/maze-runner-a-cura-mortal.jpg',
          synopsis:
              'Thomas parte em uma missão para encontrar a cura de uma doença mortal e descobre que os planos da C.R.U.E.L podem trazer consequências catastróficas para a humanidade. ',
          isFavorite: false,
          duration: 142,
          year: 2018,
          category: "Ação/Ficção científica"),
      MovieItem(
          id: 13,
          title: "16 Quadras",
          posterPath: 'assets/images/DezesseisQuadras.png',
          synopsis:
              'Tudo que o policial Jack Mosley deseja é ir para casa e tomar um drinque, mas antes ele precisa escoltar Eddie Bunker por 16 quadras até chegar ao tribunal. Eddie é um presidiário que pretende depor no tribunal, ganhar sua liberdade e abrir uma padaria.',
          isFavorite: false,
          duration: 118,
          year: 2006,
          category: "Ação/Thriller"),
      MovieItem(
          id: 14,
          title: "Tropa de Elite",
          posterPath: 'assets/images/TropadeElite.jpg',
          synopsis:
              'Nascimento, capitão da Tropa de Elite do Rio de Janeiro, é designado para chefiar uma das equipes que tem como missão apaziguar o Morro do Turano. Ele precisa cumprir as ordens enquanto procura por um substituto para ficar em seu lugar. Em meio a um tiroteio, Nascimento e sua equipe resgatam Neto e Matias, dois aspirantes a oficiais da PM. Ansiosos para entrar em ação e impressionados com a eficiência de seus salvadores, os dois se candidatam ao curso de formação da Tropa de Elite. ',
          isFavorite: false,
          duration: 115,
          year: 2007,
          category: "Crime/Ação"),
      MovieItem(
          id: 15,
          title: "CIDADE DE DEUS",
          posterPath: 'assets/images/CIDADEDEDEUS.png',
          synopsis:
              'Buscapé é um jovem pobre, negro e sensível, que cresce em um universo de muita violência. Ele vive na Cidade de Deus, favela carioca conhecida por ser um dos locais mais violentos do Rio. Amedrontado com a possibilidade de se tornar um bandido, Buscapé é salvo de seu destino por causa de seu talento como fotógrafo, o qual permite que siga carreira na profissão. É por meio de seu olhar atrás da câmera que ele analisa o dia a dia da favela em que vive, onde a violência aparenta ser infinita. ',
          isFavorite: false,
          duration: 130,
          year: 2002,
          category: "Crime/Suspense"),
      MovieItem(
          id: 16,
          title: "Donzela",
          posterPath: 'assets/images/Donzela.png',
          synopsis:
              'Uma jovem concorda em se casar com um belo príncipe, apenas para descobrir que tudo não passou de uma armadilha. Ela é jogada em uma caverna com um dragão cuspidor de fogo e deve confiar apenas em sua inteligência e vontade para sobreviver.',
          isFavorite: false,
          duration: 110,
          year: 2024,
          category: "Ação/Aventura"),
      MovieItem(
          id: 17,
          title: "Jogos Vorazes – A Cantiga dos Pássaros e das Serpentes",
          posterPath: 'assets/images/JogosVorazes.png',
          synopsis:
              'Anos antes de se tornar o presidente tirânico de Panem, Coriolanus Snow, de 18 anos, vê uma chance de mudar sua sorte quando se torna o mentor de Lucy Gray Baird, o tributo feminino do Distrito 12.',
          isFavorite: false,
          duration: 157,
          year: 2023,
          category: "Ação/Aventura"),
      MovieItem(
          id: 21,
          title: "Em Ruínas",
          posterPath: 'assets/images/Emruinas.png',
          synopsis:
              'Após um terremoto transformar Seul em uma terra sem lei, um caçador decide resgatar uma adolescente sequestrada por um médico insano. ',
          isFavorite: false,
          duration: 107,
          year: 2024,
          category: "Ação/Ficção científica"),
      MovieItem(
          id: 22,
          title: "A Velha Guarda",
          posterPath: 'assets/images/AVelhaGuarda.png',
          synopsis:
              'Um grupo de mercenários com o dom da imortalidade protege a humanidade há séculos e faz de tudo para manter sua identidade em segredo. Mas tudo muda quando alguém descobre seu segredo e eles passam a ser caçados.',
          isFavorite: false,
          duration: 125,
          year: 2020,
          category: "Ação/Fantasia"),
      MovieItem(
          id: 23,
          title: "A Velha Guarda 2",
          posterPath: 'assets/images/AVelhaGuarda2.png',
          synopsis:
              'The Old Guard 2 é um futuro filme de ação e ficção científica de super-heróis americano dirigido por Victoria Mahoney, a partir de um roteiro de Greg Rucka, baseado em sua história em quadrinhos de mesmo nome. ',
          isFavorite: false,
          duration: 118,
          year: 2024,
          category: "Ação/Aventura"),
      MovieItem(
          id: 24,
          title: "Lift: Roubo nas Alturas",
          posterPath: 'assets/images/lift.png',
          synopsis:
              'Um ladrão e sua equipe tentam fazer um assalto de 500 milhões de dólares em um avião. ',
          isFavorite: false,
          duration: 107,
          year: 2024,
          category: "Comédia/Ação"),
    ];

    _anims = [
      MovieItem(
          id: 3,
          title: "Kung Fu Panda 4",
          posterPath: 'assets/images/kungfu-panda.jpg',
          synopsis:
              'Po está prestes a tornar-se o novo líder espiritual do Vale da Paz, mas antes disso, ele deve encontrar um sucessor para se tornar o novo Guerreiro Dragão. Parece que ele encontra um em Zhen, uma raposa com muitas habilidades promissoras, mas que não gosta muito da ideia de Po treiná-lo.',
          isFavorite: false,
          duration: 94,
          year: 2024,
          category: "Comédia/Aventura"),
      MovieItem(
          id: 4,
          title: "Frozen - O Reino do Gelo",
          posterPath: 'assets/images/frozen.jpg',
          synopsis:
              'Acompanhada por um vendedor de gelo, a jovem e destemida princesa Anna parte em uma jornada por perigosas montanhas de gelo na esperança de encontrar sua irmã, a rainha Elsa, e acabar com a terrível maldição de inverno eterno, que está provocando o congelamento do reino.',
          isFavorite: false,
          duration: 102,
          year: 2013,
          category: "Infantil/Musical"),
      MovieItem(
          id: 8,
          title: "A Pequena Sereia (2023)",
          posterPath: 'assets/images/APequenaSereia2023.jpg',
          synopsis:
              'Uma jovem sereia faz um acordo com uma bruxa do mar para trocar sua bela voz por pernas humanas para que possa descobrir o mundo acima da água e impressionar um príncipe.',
          isFavorite: false,
          duration: 135,
          year: 2023,
          category: "Infantil/Fantasia"),
      MovieItem(
          id: 9,
          title: "A Bela e a Fera",
          posterPath: 'assets/images/ABelaeaFera.jpg',
          synopsis:
              'Moradora de uma pequena aldeia francesa, Bela tem o pai capturado pela Fera e decide entregar sua vida ao estranho ser em troca da liberdade do progenitor. No castelo, ela conhece objetos mágicos e descobre que a Fera é na verdade um príncipe que precisa de amor para voltar à forma humana. ',
          isFavorite: false,
          duration: 130,
          year: 2017,
          category: "Infantil/Musical"),
      MovieItem(
          id: 18,
          title: "WALL-E",
          posterPath: 'assets/images/WALL-E.jpg',
          synopsis:
              'Após entulhar a Terra de lixo e poluir a atmosfera com gases tóxicos, a humanidade deixou o planeta e passou a viver em uma gigantesca nave. O plano era que o retiro durasse alguns poucos anos, com robôs sendo deixados para limpar o planeta. WALL-E é o último destes robôs, e sua vida consiste em compactar o lixo existente no planeta. Até que um dia surge repentinamente uma nave, que traz um novo e moderno robô: Eva. A princípio curioso, WALL-E se apaixona e resolve segui-la por toda a galáxia.',
          isFavorite: false,
          duration: 98,
          year: 2008,
          category: "Infantil/Ficção científica"),
      MovieItem(
          id: 20,
          title: "Raya e o Último Dragão",
          posterPath: 'assets/images/RayaeoultimoDragao.jpg',
          synopsis:
              'Há muito tempo, no mundo de fantasia de Kumandra, humanos e dragões viviam juntos em harmonia. Mas quando uma força maligna ameaçou a terra, os dragões se sacrificaram para salvar a humanidade. Agora, 500 anos depois, o mesmo mal voltou e cabe a uma guerreira solitária, Raya, rastrear o lendário último dragão para restaurar a terra despedaçada e seu povo dividido.',
          isFavorite: false,
          duration: 90,
          year: 2021,
          category: "Infantil/Fantasia"),
    ];

    _drama = [
      MovieItem(
          id: 10,
          title: "Oppenheimer",
          posterPath: 'assets/images/Oppenheimer.jpg',
          synopsis:
              'O físico J. Robert Oppenheimer trabalha com uma equipe de cientistas durante o Projeto Manhattan, levando ao desenvolvimento da bomba atômica.',
          isFavorite: false,
          duration: 180,
          year: 2023,
          category: "Suspense/Obra de Época"),
      MovieItem(
          id: 11,
          title: "Interstellar",
          posterPath: 'assets/images/Interstellar.jpg',
          synopsis:
              'As reservas naturais da Terra estão chegando ao fim e um grupo de astronautas recebe a missão de verificar possíveis planetas para receberem a população mundial, possibilitando a continuação da espécie. Cooper é chamado para liderar o grupo e aceita a missão sabendo que pode nunca mais ver os filhos. Ao lado de Brand, Jenkins e Doyle, ele seguirá em busca de um novo lar. ',
          isFavorite: false,
          duration: 169,
          year: 2014,
          category: "Ficção científica/Aventura"),
      MovieItem(
          id: 12,
          title: "O Diário da Nossa Paixão",
          posterPath: 'assets/images/odiariodanossapaixao.jpg',
          synopsis:
              'Na década de 1940, na Carolina do Sul, o operário Noah Calhoun e a rica Allie se apaixonam desesperadamente, mas os pais da jovem não aprovam o namoro. Noah é enviado para lutar na Segunda Guerra Mundial, e parece ser o fim do romance. Enquanto isso, Allie se envolve com outro homem. No entanto, a paixão deles ainda não acabou quando Noah retorna para a pequena cidade anos mais tarde, próximo ao casamento de Allie. ',
          isFavorite: false,
          duration: 121,
          year: 2004,
          category: "Romance/Drama"),
    ];

    _crime = [
      MovieItem(
          id: 2,
          title: 'Pulp Fiction',
          posterPath: 'assets/images/pulp-fiction.jpg',
          synopsis:
              'Assassino que trabalha para a máfia se apaixona pela esposa de seu chefe quando é convidado a acompanhá-la, um boxeador descumpre sua promessa de perder uma luta e um casal tenta um assalto que rapidamente sai do controle.',
          isFavorite: false,
          duration: 154,
          year: 1995,
          category: "Crime/Thriller"),
      MovieItem(
          id: 14,
          title: "Tropa de Elite",
          posterPath: 'assets/images/TropadeElite.jpg',
          synopsis:
              'Nascimento, capitão da Tropa de Elite do Rio de Janeiro, é designado para chefiar uma das equipes que tem como missão apaziguar o Morro do Turano. Ele precisa cumprir as ordens enquanto procura por um substituto para ficar em seu lugar. Em meio a um tiroteio, Nascimento e sua equipe resgatam Neto e Matias, dois aspirantes a oficiais da PM. Ansiosos para entrar em ação e impressionados com a eficiência de seus salvadores, os dois se candidatam ao curso de formação da Tropa de Elite. ',
          isFavorite: false,
          duration: 115,
          year: 2007,
          category: "Crime/Ação"),
      MovieItem(
          id: 15,
          title: "CIDADE DE DEUS",
          posterPath: 'assets/images/CIDADEDEDEUS.png',
          synopsis:
              'Buscapé é um jovem pobre, negro e sensível, que cresce em um universo de muita violência. Ele vive na Cidade de Deus, favela carioca conhecida por ser um dos locais mais violentos do Rio. Amedrontado com a possibilidade de se tornar um bandido, Buscapé é salvo de seu destino por causa de seu talento como fotógrafo, o qual permite que siga carreira na profissão. É por meio de seu olhar atrás da câmera que ele analisa o dia a dia da favela em que vive, onde a violência aparenta ser infinita. ',
          isFavorite: false,
          duration: 130,
          year: 2002,
          category: "Crime/Suspense"),
    ];

    _scifi = [
      MovieItem(
          id: 1,
          title: 'Godzilla Minus One',
          posterPath: 'assets/images/godzilla.jpg',
          synopsis:
              'O filme se passa em Japão social e economicamente devastado após o término da Segunda Guerra Mundial, na qual o país saiu perdendo. A situação chega a um nível ainda mais crítico quando uma gigantesca e misteriosa criatura surge do mar para assolar o país, o temível kaiju. Sob esse pano de fundo, sentindo-se como se tivesse enganado a morte muitas vezes, está Kōichi Shikishima (Ryunosuke Kamiki), um piloto Kamikaze. E quando seu grupo é atacado na Ilha Odo, com muitos mortos pelo monstro gigantesco, uma enorme culpa pesa sobre Shikishima, agora sobrevivente. Entrando assim, em uma missão pessoal, para defender suas pessoas queridas e vingar a morte de seus companheiros, Shikishima se une a um grande grupo de veteranos de Guerra, para finalmente derrotar o monstro conhecido como Godzilla.',
          isFavorite: false,
          duration: 125,
          year: 2023,
          category: "Ação/Ficção"),
      MovieItem(
          id: 5,
          title: "Maze Runner - Correr Ou Morrer",
          posterPath: 'assets/images/maze-runner-correr-ou-morrer.jpg',
          synopsis:
              'Em um futuro apocalíptico, o jovem Thomas é escolhido para enfrentar o sistema. Ele acorda dentro de um escuro elevador em movimento e não consegue se lembrar nem de seu nome. Na comunidade isolada em que foi abandonado, Thomas conhece outros garotos que passaram pela mesma situação. Para conseguir escapar, ele precisa descobrir os sombrios segredos guardados em sua mente e correr muito.',
          isFavorite: false,
          duration: 113,
          year: 2014,
          category: "Ficção científica/Ação"),
      MovieItem(
          id: 6,
          title: "Maze Runner: Provas de Fogo",
          posterPath: 'assets/images/maze-runner-prova-de-fogo.jpg',
          synopsis:
              'Depois de escapar do labirinto, Thomas e os garotos que o acompanharam em sua fuga encontram uma realidade bem diferente: a superfície da Terra foi queimada pelo Sol e eles precisam lidar com criaturas disformes chamadas Cranks.',
          isFavorite: false,
          duration: 133,
          year: 2015,
          category: "Ficção científica/Ação"),
      MovieItem(
          id: 7,
          title: "Maze Runner: A Cura Mortal",
          posterPath: 'assets/images/maze-runner-a-cura-mortal.jpg',
          synopsis:
              'Thomas parte em uma missão para encontrar a cura de uma doença mortal e descobre que os planos da C.R.U.E.L podem trazer consequências catastróficas para a humanidade. ',
          isFavorite: false,
          duration: 142,
          year: 2018,
          category: "Ação/Ficção científica"),
      MovieItem(
          id: 11,
          title: "Interstellar",
          posterPath: 'assets/images/Interstellar.jpg',
          synopsis:
              'As reservas naturais da Terra estão chegando ao fim e um grupo de astronautas recebe a missão de verificar possíveis planetas para receberem a população mundial, possibilitando a continuação da espécie. Cooper é chamado para liderar o grupo e aceita a missão sabendo que pode nunca mais ver os filhos. Ao lado de Brand, Jenkins e Doyle, ele seguirá em busca de um novo lar. ',
          isFavorite: false,
          duration: 169,
          year: 2014,
          category: "Ficção científica/Aventura"),
      MovieItem(
          id: 18,
          title: "WALL-E",
          posterPath: 'assets/images/WALL-E.jpg',
          synopsis:
              'Após entulhar a Terra de lixo e poluir a atmosfera com gases tóxicos, a humanidade deixou o planeta e passou a viver em uma gigantesca nave. O plano era que o retiro durasse alguns poucos anos, com robôs sendo deixados para limpar o planeta. WALL-E é o último destes robôs, e sua vida consiste em compactar o lixo existente no planeta. Até que um dia surge repentinamente uma nave, que traz um novo e moderno robô: Eva. A princípio curioso, WALL-E se apaixona e resolve segui-la por toda a galáxia.',
          isFavorite: false,
          duration: 98,
          year: 2008,
          category: "Infantil/Ficção científica"),
      MovieItem(
          id: 21,
          title: "Em Ruínas",
          posterPath: 'assets/images/Emruinas.png',
          synopsis:
              'Após um terremoto transformar Seul em uma terra sem lei, um caçador decide resgatar uma adolescente sequestrada por um médico insano. ',
          isFavorite: false,
          duration: 107,
          year: 2024,
          category: "Ação/Ficção científica"),
    ];

    _comedy = [
      MovieItem(
          id: 3,
          title: "Kung Fu Panda 4",
          posterPath: 'assets/images/kungfu-panda.jpg',
          synopsis:
              'Po está prestes a tornar-se o novo líder espiritual do Vale da Paz, mas antes disso, ele deve encontrar um sucessor para se tornar o novo Guerreiro Dragão. Parece que ele encontra um em Zhen, uma raposa com muitas habilidades promissoras, mas que não gosta muito da ideia de Po treiná-lo.',
          isFavorite: false,
          duration: 94,
          year: 2024,
          category: "Comédia/Aventura"),
      MovieItem(
          id: 18,
          title: "WALL-E",
          posterPath: 'assets/images/WALL-E.jpg',
          synopsis:
              'Após entulhar a Terra de lixo e poluir a atmosfera com gases tóxicos, a humanidade deixou o planeta e passou a viver em uma gigantesca nave. O plano era que o retiro durasse alguns poucos anos, com robôs sendo deixados para limpar o planeta. WALL-E é o último destes robôs, e sua vida consiste em compactar o lixo existente no planeta. Até que um dia surge repentinamente uma nave, que traz um novo e moderno robô: Eva. A princípio curioso, WALL-E se apaixona e resolve segui-la por toda a galáxia.',
          isFavorite: false,
          duration: 98,
          year: 2008,
          category: "Infantil/Ficção científica"),
      MovieItem(
          id: 19,
          title: "Divertida-Mente",
          posterPath: 'assets/images/Divertida-Mente.png',
          synopsis:
              'Com a mudança para uma nova cidade, as emoções de Riley, que tem apenas 11 anos de idade, ficam extremamente agitadas. Uma confusão na sala de controle do seu cérebro deixa a Alegria e a Tristeza de fora, afetando a vida de Riley radicalmente. ',
          isFavorite: false,
          duration: 95,
          year: 2015,
          category: "Comédia/Fantasia"),
      MovieItem(
          id: 24,
          title: "Lift: Roubo nas Alturas",
          posterPath: 'assets/images/lift.png',
          synopsis:
              'Um ladrão e sua equipe tentam fazer um assalto de 500 milhões de dólares em um avião. ',
          isFavorite: false,
          duration: 107,
          year: 2024,
          category: "Comédia/Ação"),
    ];
  }

  List<List<MovieItem>> moviesList() {
    return List.unmodifiable(
        [_action, _anims, _drama, _comedy, _scifi, _crime]);
  }

// void toggleFavorite(int id) {
//   _movies.firstWhere((movie) => movie.id == id).isFavorite = !_movies.firstWhere((movie) => movie.id == id).isFavorite;
// }
}
