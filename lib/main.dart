import 'package:flutter/material.dart';

import 'SecondScreen.dart';

void main() {
  // Call the getQuestionList() method on the instance
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          backgroundColor: Color(0xFFEE006d77),
          // appBar: AppBar(title: Text('Categories')),
          body: QuizCategories(),
        ));
  }
}

class QuizCategories extends StatelessWidget {
  // Sample list of categories (replace this with your actual categories)
  final List<Map<String, dynamic>> questionList = [
    {
      'categoryName': 'TENNIS',
      'question': '"How large should be the table for the game?"',
      'answers': [
        '11 ft. by 5 ft. (2.7 m. by 1.5 m.)',
        '7 ft. by 5 ft. (2.7 m. by 1.5 m.)',
        '9 ft. by 5 ft. (2.7 m. by 1.5 m.)',
        '12 ft. by 5 ft. (2.7 m. by 1.5 m.)'
      ],
      'correctAnswer': 3
    },
    {
      'categoryName': 'TENNIS',
      'question': 'In what year did table tennis become an Olympic sport?',
      'answers': ['1976', '1988', '1968', '1994'],
      'correctAnswer': 2
    },
    {
      'categoryName': 'TENNIS',
      'question': 'In what country did table tennis originate?',
      'answers': ['Sweden', 'Spain', 'England', 'Japan'],
      'correctAnswer': 3
    },
    {
      'categoryName': 'SOCCER',
      'question': 'What country won the 2020 / 2021 European Championship?',
      'answers': ['Spain', 'France', 'Italy', 'Germany'],
      'correctAnswer': 3
    },
    {
      'categoryName': 'SOCCER',
      'question': 'What club team is commonly known as the ‘Red Devils’?',
      'answers': [
        'Liverpool',
        'Manchester United',
        'Manchester City',
        'Everton'
      ],
      'correctAnswer': 2
    },
    {
      'categoryName': 'SOCCER',
      'question': 'What is the name of the top division in Italy?',
      'answers': ['Serie A', 'Ligue A', 'Premier Ligue', 'Division A'],
      'correctAnswer': 1
    },
    {
      'categoryName': 'CHESS',
      'question': 'How many squares does a chessboard have?',
      'answers': ['65', '32', '64', '99'],
      'correctAnswer': 3
    },
    {
      'categoryName': 'CHESS',
      'question': 'Who were the opponents in the famous Evergreen Game?',
      'answers': [
        'Adolf Anderssen vs. Jean Dufresne',
        'Wilhelm Steinitz vs. Emanuel Lasker',
        'Jose Raul Capablanca vs. Alexander Alekhine',
        ' Paul Morphy vs. Howard Staunton'
      ],
      'correctAnswer': 1
    },
    {
      'categoryName': 'CHESS',
      'question':
      'How many moves was the longest [known] chess game in history?',
      'answers': ['101', '231', '269', '382'],
      'correctAnswer': 3
    },
    {
      'categoryName': 'BASKETBALL',
      'question': 'Who invented the game in 1891?',
      'answers': [
        'Jack Wilshore',
        'Mark Shtutz',
        'James Naismith',
        'Meyn Anderson'
      ],
      'correctAnswer': 3
    },
    {
      'categoryName': 'BASKETBALL',
      'question':
      'How many players in total are on a basketball court at the same time?',
      'answers': [
        '10 (5-a-side)',
        '12 (6-a-side)',
        '8 (4-a-side)',
        '14 (7-a-side)'
      ],
      'correctAnswer': 1
    },
    {
      'categoryName': 'BASKETBALL',
      'question':
      'The United States men\'s Olympic basketball team, nicknamed the \"Dream Team\", competed in which year at the Olympics?',
      'answers': [
        '1989 (Istanbul)',
        '1994 (Manchester)',
        '1992 (Barcelona)',
        '1996 (New York)'
      ],
      'correctAnswer': 3
    },
    {
      'categoryName': 'BADMINTON',
      'question': 'What is badminton?',
      'answers': ['A group', 'A type of house', 'A sport', 'A band'],
      'correctAnswer': 3
    },
    {
      'categoryName': 'BADMINTON',
      'question': 'What is the name of the object that is hit in badminton?',
      'answers': ['Shuttlecock', 'Ball', 'Featherball', 'Fireball'],
      'correctAnswer': 1
    },
    {
      'categoryName': 'BADMINTON',
      'question': 'Where did the game develop?',
      'answers': [
        'Ancient China',
        'Ancient Rome',
        'Ancient Greece',
        'British India'
      ],
      'correctAnswer': 4
    },
    {
      'categoryName': 'CYCLING',
      'question':
      'What color are the spots on the white \'King of the Mountains\' jersey in the Tour de France?',
      'answers': ['A group', 'A type of house', 'Red', 'A band'],
      'correctAnswer': 3
    },
    {
      'categoryName': 'CYCLING',
      'question':
      'What is the cycling technique of getting into the slipstream of another rider?',
      'answers': ['Drafting', 'Rafting', 'Grafting', 'Crafting'],
      'correctAnswer': 1
    },
    {
      'categoryName': 'CYCLING',
      'question': 'What is the proper name for a cycling track?',
      'answers': ['Cosmodrome', 'Palindrome', 'Velodrome', 'Aerodrome'],
      'correctAnswer': 3
    }
  ];

  final List<Map<String, dynamic>> categories = [
    {'name': 'TENNIS', 'icon': Icons.ac_unit_sharp, 'quizAmount': 10},
    {'name': 'SOCCER', 'icon': Icons.bakery_dining_outlined, 'quizAmount': 10},
    {'name': 'CHESS', 'icon': Icons.account_balance_wallet, 'quizAmount': 10},
    {'name': 'BASKETBALL', 'icon': Icons.accessible_sharp, 'quizAmount': 10},
    {'name': 'BADMINTON', 'icon': Icons.ac_unit_sharp, 'quizAmount': 10},
    {'name': 'CYCLING', 'icon': Icons.ac_unit_sharp, 'quizAmount': 10}
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: EdgeInsets.all(8.0),
          color: Color(0xFFEE83c5be),
          child: SizedBox(
            width: double.infinity,
            height: 150.0,
            child: Center(
              child: ListTile(
                leading: Icon(
                  categories[index]['icon'],
                  size: 60,
                  color: Color(0xFFEE006d77),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      categories[index]['name'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFEE006d77)),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Quiz Amount: ${categories[index]['quizAmount']}',
                      style: TextStyle(color: Color(0xFFEE006d77)),
                    ),
                  ],
                ),
                onTap: () {
                  // Navigate to the quiz screen when a category is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(
                        categoryQuestions: questionList,
                        categoryName: categories[index]['name'],
                        totalQuestions: categories[index]['quizAmount'],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
