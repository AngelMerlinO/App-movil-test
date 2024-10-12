import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:phone_app/screen/chatbot.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'iOS Styled App',
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.systemGreen,
        barBackgroundColor: CupertinoColors.black,
        textTheme: CupertinoTextThemeData(
          primaryColor: CupertinoColors.systemGreen,
        ),
      ),
      home: const MainScreen(),
    );
  }
}


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CounterScreen(),
    const RickAndMortyScreen(),
    const ChatbotPage(), // Agrega la pantalla del chatbot aquí
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_2),
            label: 'Contador',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cloud_download),
            label: 'R&M',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_text),
            label: 'Chatbot', // Nueva pestaña para el chatbot
          ),
        ],
        activeColor: CupertinoColors.systemGreen,
        backgroundColor: CupertinoColors.black,
        inactiveColor: CupertinoColors.systemGrey,
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return _screens[index];
          },
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Inicio'),
        backgroundColor: CupertinoColors.black,
        brightness: Brightness.dark,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _makePhoneCall('9515271070'),
                  child: const Icon(
                    CupertinoIcons.phone_solid,
                    color: CupertinoColors.systemGreen,
                    size: 25,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () => _launchURL('https://www.linkedin.com/in/jose-angel-ortega-merlin-a6153b225/'),
                  child: const Text(
                    'Jose Angel Ortega Merlin',
                    style: TextStyle(
                      color: CupertinoColors.systemGreen,
                      decoration: TextDecoration.none,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () => _sendTextMessage('9515271070'),
                  child: const Icon(
                    CupertinoIcons.chat_bubble_text_fill,
                    color: CupertinoColors.systemGreen,
                    size: 25,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Center(
                child: Image.network(
                  'https://static.wikia.nocookie.net/doblaje-fanon/images/2/2c/CaraCortada83.jpg/revision/latest?cb=20231114203743&path-prefix=es',
                  width: 350,
                  height: 400,
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => _launchURL('https://github.com/DarinelGuillen/phone_app'),
              child: const Text(
                'Repositorio Act.1',
                style: TextStyle(
                  color: Color.fromARGB(255, 136, 145, 139),
                  decoration: TextDecoration.underline,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _launchURL('https://github.com/AngelMerlinO/Merlin-APP-'),
              child: const Text(
                'Repositorio Act.2',
                style: TextStyle(
                  color: Color.fromARGB(255, 136, 145, 139),
                  decoration: TextDecoration.underline,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _makePhoneCall(String phoneNumber) async {
    final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  void _sendTextMessage(String phoneNumber) async {
    final Uri smsUri = Uri(scheme: 'sms', path: phoneNumber);
    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri);
    } else {
      throw 'Could not send message to $phoneNumber';
    }
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Contador'),
        backgroundColor: CupertinoColors.black,
        brightness: Brightness.dark,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Presionar para aumentar:',
              style: TextStyle(
                fontSize: 20,
                color: CupertinoColors.systemGreen,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _incrementCounter,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: CupertinoColors.activeGreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$_counter',
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _counter.isEven ? 'Numero par' : 'Numero impar',
              style: const TextStyle(
                fontSize: 18,
                color: CupertinoColors.systemGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RickAndMortyScreen extends StatefulWidget {
  const RickAndMortyScreen({super.key});

  @override
  _RickAndMortyScreenState createState() => _RickAndMortyScreenState();
}

class _RickAndMortyScreenState extends State<RickAndMortyScreen> {
  List<dynamic> _characters = [];
  bool _isLoading = false;

  Future<void> _fetchRickAndMortyCharacters() async {
    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('https://rickandmortyapi.com/api/character/');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _characters = data['results'];
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load characters');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Rick and Morty Characters'),
        backgroundColor: CupertinoColors.black,
        brightness: Brightness.dark,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton.filled(
              onPressed: _fetchRickAndMortyCharacters,
              child: const Text('Fetch Characters'),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CupertinoActivityIndicator()
                : _characters.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: _characters.length,
                          itemBuilder: (context, index) {
                            final character = _characters[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 3,
                                child: ListTile(
                                  leading: Image.network(character['image']),
                                  title: Text(character['name']),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Status: ${character['status']}'),
                                      Text('Species: ${character['species']}'),
                                      Text('Origin: ${character['origin']['name']}'),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : const Text('No characters to display'),
          ],
        ),
      ),
    );
  }
}
