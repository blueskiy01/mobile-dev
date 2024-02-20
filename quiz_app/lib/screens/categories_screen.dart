import 'package:flutter/material.dart';
import '/models/Category.dart';
import '/models/Question.dart';
import '/screens/detailed_view.dart';

List<Category> getCategoriesWithQuestions(){
  List<Category> categories = [
    Category(
      'Films',
      'assets/images/films.jpg',
        [ Question('The movie "The Shawshank Redemption" is based on a novel by Stephen King.', true),
          Question('Leonardo DiCaprio won his first Oscar for his performance in the movie "Titanic."', false),
          Question('The "Lord of the Rings" trilogy is based on a novel by J.R.R. Tolkien.', true),
          Question('Alfred Hitchcock directed the movie "Psycho."', true),
          Question('The character Harry Potter has a scar on his forehead shaped like a lightning bolt.', true),
          Question('The movie "Forrest Gump" is based on a novel by Winston Groom.', true),
          Question('The first "Star Wars" movie was released in 1977.', true),
          Question('The main character in the movie "The Matrix" is named Neo.', true),
          Question('Steven Spielberg directed the movie "Jurassic Park."', true),
          Question('The movie "The Godfather" was released in the 1980s.', false),
          Question('Meryl Streep won an Oscar for her role in the movie "The Devil Wears Prada."', false),
          Question('The character Darth Vader says the line "May the Force be with you" in "Star Wars."', false),
          Question('The movie "The Silence of the Lambs" is about a serial killer named Hannibal Lecter.', true),
          Question('The movie "Inception" was directed by Christopher Nolan.', true),
          Question('The "Harry Potter" series consists of seven books.', true),
        ]

    ),
    Category(
      'Music',
      'assets/images/music.jpg',
      [   Question('Ludwig van Beethoven was deaf.', true),
          Question('The guitar typically has six strings.', true),
          Question('Elvis Presley was known as the King of Pop.', false),
          Question('A saxophone is a brass instrument.', true),
          Question('The Beatles originally started as a quartet.', true),
          Question('Mozart wrote his first symphony when he was 8 years old.', true),
          Question('Elvis Presley was a natural blonde.', true),
          Question('Jimi Hendrix played guitar with his left hand.', false),
          Question('Michael Jackson won 8 Grammy Awards in 1984, the most Grammys won in a single year.', true),
          Question('Before gaining fame as a performer, Lady Gaga was a songwriter for several pop artists, including Britney Spears.', true),
          Question('"Staying Alive" by the Bee Gees has a tempo of 100-120 beats per minute, which aligns with the recommended pace for performing CPR chest compressions.', true),
          Question('The French horn is originally from France.', false),
          Question('The guitar was originally a European instrument introduced to America by Spanish settlers.', true),
          Question('The longest officially released song is "The Rise and Fall of Bossanova," lasting over 13 hours.', true),
          Question('AC/DC originally formed in Australia but all of its founding members were born in Scotland.', true),
      ],
    ),
    Category(
      'History',
      'assets/images/history.jpg',
      [
          Question('The Battle of Hastings took place in 1066.', true),
          Question('The French Revolution began in 1789.', true),
          Question('Napoleon Bonaparte was defeated at the Battle of Waterloo.', true),
          Question('The Titanic sank in 1912 after hitting an iceberg.', true),
          Question('The United States declared independence from Great Britain in 1776.', true),
          Question('The Renaissance period occurred during the 14th to 17th centuries.', true),
          Question('The Magna Carta was signed in 1215.', true),
          Question('The Industrial Revolution started in England in the late 18th century.', true),
          Question('The Berlin Wall fell in 1989, marking the end of the Cold War.', true),
          Question('The Black Death, or Bubonic Plague, swept through Europe in the 14th century.', true),
          Question('The Declaration of Independence was written by Thomas Jefferson.', true),
          Question('The Russian Revolution took place in 1917.', true),
          Question('The Wright brothers successfully flew the first powered airplane in 1903.', true),
          Question('The Great Depression began with the stock market crash of 1929.', true),
          Question('The Treaty of Versailles was signed in 1919, officially ending World War I.', true),
      ],
    ),
    Category(
      'Europe',
      'assets/images/europe.jpg',
        [
          Question('Europe is the second smallest continent by land area.', true),
          Question('The European Union has 27 member countries.', true),
          Question('The capital city of France is Paris.', true),
          Question('The tallest mountain in Europe is Mount Elbrus.', true),
          Question('The Euro is the official currency of most European Union countries.', true),
          Question('The Vatican City is the smallest country in Europe by both area and population.', true),
          Question('The Colosseum, located in Rome, Italy, is one of Europe\'s most famous landmarks.', true),
          Question('The European Union was established after World War II to promote economic cooperation and prevent future conflicts.', true),
          Question('The Alps mountain range spans several European countries, including France, Switzerland, and Italy.', true),
          Question('The United Kingdom consists of four countries: England, Scotland, Wales, and Northern Ireland.', true),
          Question('The city of Amsterdam, in the Netherlands, is known for its extensive canal system.', true),
          Question('The Acropolis, located in Athens, Greece, is a UNESCO World Heritage Site.', true),
          Question('The longest river in Europe is the Volga River, located in Russia.', true),
          Question('Germany is the most populous country in the European Union.', true),
          Question('The Danube River flows through more countries than any other river in the world.', true),
        ],
    ),
    Category(
      'Games',
      'assets/images/game.jpg',
      [
        Question('The first "Super Mario" game was released in 1985.', true),
        Question('The main character in "The Legend of Zelda" is named Link.', true),
        Question('The "Halo" series is primarily set in a post-apocalyptic world.', true),
        Question('The "Assassin\'s Creed" series is developed by Ubisoft.', true),
        Question('The "Call of Duty" series is primarily set during World War II.', false),
        Question('The "Final Fantasy" series is developed by Square Enix.', true),
        Question('The "Grand Theft Auto" series is set in the fictional city of Los Santos.', false),
        Question('The "Minecraft" game was officially released in 2009.', true),
        Question('The "Pokémon" series was first introduced in the 1990s.', true),
      ],
    ),
  ];
  return categories;
}

class CategoriesPage extends StatelessWidget {
  final List<Category> categories = getCategoriesWithQuestions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuizzApp - Select a Category'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10, // Horizontal space between items
          mainAxisSpacing: 10, // Vertical space between items
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailedView(category: categories[index]),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: Offset(0, 3), // Changes position of shadow
                  ),
                ],
              ),
              child: GridTile(
                footer: GridTileBar(
                  backgroundColor: Colors.black45,
                  title: Text(categories[index].name,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center),
                ),
                child: ClipRRect( // Clip it to have nice rounded corners
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  child: Image.asset(categories[index].imageUrl, fit: BoxFit.cover),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}