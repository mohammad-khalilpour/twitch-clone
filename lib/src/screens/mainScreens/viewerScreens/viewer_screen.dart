import 'package:flutter/material.dart';
import 'package:twitch_clone/src/screens/mainScreens/createScreens/create_screen.dart';
import 'package:twitch_clone/src/screens/mainScreens/viewerScreens/browse_screen.dart';
import 'package:twitch_clone/src/screens/mainScreens/viewerScreens/discover_screen.dart';
import 'package:twitch_clone/src/screens/mainScreens/viewerScreens/following_screen.dart';
import 'package:twitch_clone/src/screens/mainScreens/viewerScreens/search_screen.dart';

class VeiwerScreen extends StatefulWidget {
  const VeiwerScreen({super.key});

  @override
  State<VeiwerScreen> createState() => _VeiwerScreenState();
}

class _VeiwerScreenState extends State<VeiwerScreen> {
  int _currentIndex = 0;
  final List<Widget> _screenBody = [
    const FollowingScreen(),
    const DiscoverScreen(),
    const BrowseScreen(),
    const SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _screenBody[_currentIndex],
      bottomNavigationBar: _bottomNavigationBar(),
      backgroundColor: Colors.black,
    );
  }

  AppBar _appBar() {
    return _currentIndex != 3
        ? AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.account_circle_rounded,
              ),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.messenger_outline_rounded),
              ),
              SizedBox(
                width: 100,
                height: 10,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const createScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: const Color.fromARGB(255, 125, 120, 120),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.feed_outlined),
                      Text("create"),
                    ],
                  ),
                ),
              )
            ],
          )
        : AppBar(
            title: const Text('search'),
          );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: onTabTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Home',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.my_location),
          label: 'Discover',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.browse_gallery),
          label: 'Browse',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
          ),
          label: 'Search',
          backgroundColor: Colors.black,
        ),
      ],
      backgroundColor: Colors.black,
      fixedColor: const Color.fromARGB(255, 208, 54, 231),
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
