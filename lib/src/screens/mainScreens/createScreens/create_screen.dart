import 'package:flutter/material.dart';
import 'package:twitch_clone/src/screens/mainScreens/createScreens/analytics_screen.dart';
import 'package:twitch_clone/src/screens/mainScreens/createScreens/content_screen.dart';
import 'package:twitch_clone/src/screens/mainScreens/createScreens/dashbord_screen.dart';

class createScreen extends StatefulWidget {
  const createScreen({super.key});

  @override
  State<createScreen> createState() => _createScreenState();
}

class _createScreenState extends State<createScreen> {
  int _currentIndex = 0;
  final List<Widget> _screenBody = [
    const DashordScreen(),
    const ContentScreen(),
    const AnalyticsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _screenBody[_currentIndex],
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: const [Icon(Icons.video_call), Text('Go live')],
        ),
        onPressed: () {},
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      backgroundColor: Colors.black,
    );
  }

  AppBar _appBar() {
    return AppBar(
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
              Navigator.of(context).pop();
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
                Icon(Icons.remove_red_eye_outlined),
                Text("watch"),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: onTabTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Dashboard',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.ondemand_video_outlined),
          label: 'Content',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.analytics),
          label: 'Analytics',
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
