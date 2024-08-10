import 'package:flutter/material.dart';
const _selectedBgColor = Color.fromARGB(255, 88, 34, 181);
const _unselectedBgColor = Colors.white;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() {
    return _MyHomePageState();
    }
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePageContent(),
    const Text('Saved Page'),
    const Text('Settings Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

    });
  }

  Color _getBgColor(int index) =>
    _selectedIndex == index ? _selectedBgColor : _unselectedBgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:  const Color(0xFF00021C),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
          //  Color(0xFF000000), // Black
          Color(0xFF00021C), // Dark Navy Blue
          Color(0xFF001932), // Deep Blue
          Color(0xFF002D48), // Dark Cyan
          Color(0xFF004460),
          // Color(0xFF00BEAE), 

          ],
        ),
      ),
      child: const Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child :Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Heading',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey,
                ),
              ],
            ),
          
            SizedBox(height: 40),
            Center(
              child: EventCard(
                title: 'Exclusive Events',
                description: 'Lorem ipsum dolor sit amet',
                isExclusive: true,
              ),
            ),
            SizedBox(height: 20),
            EventCard(
              title: 'Event 1',
              description: 'Lorem ipsum dolor sit amet, consectetur',
              isExclusive: false,
            ),
            EventCard(
              title: 'Event 2',
              description: 'Lorem ipsum dolor sit amet, consectetur',
              isExclusive: false,
            ),
            EventCard(
              title: 'Event 3',
              description: 'Lorem ipsum dolor sit amet, consectetur',
              isExclusive: false,
            ),
          ],
        ),
      ),
      )
      ),
    );
  }
}
// class ExclusiveCard extends StatelessWidget{
//   final String title;
//   final String description;
//   ExclusiveCard({required this.title, required this.description});

//   Widget build
// }
class EventCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isExclusive;

  const EventCard({super.key, required this.title, required this.description, this.isExclusive = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: isExclusive? double.infinity: null,
        padding: isExclusive? EdgeInsets.all(20.0) : EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color(0xFF00021C),
          borderRadius: BorderRadius.circular(12),
        ),
        child: isExclusive? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.grey,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 4,),
            Text(
              description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            )
          ],
        )
        : ListTile(
          leading: Container(
            width: 50,
            height: 50,
            color: Colors.grey,
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            description,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}