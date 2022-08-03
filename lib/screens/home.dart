import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/theme/constants.dart';
import '/theme/provider.dart';

import '/screens/program/prog_page.dart';
import '/screens/resources/res_page.dart';
import '/screens/songs/songs_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> children = [
    const ProgPage(),
    const ResPage(),
    const SongsPage(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: false,
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Al servizio del Re'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                left: kDefaultPadding, right: kDefaultPadding),
            child: Row(
              children: [
                Icon(
                  themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                ),
                Switch(
                  value: themeProvider.isDarkMode,
                  onChanged: (value) {
                    final themeProvider =
                        Provider.of<ThemeProvider>(context, listen: false);
                    themeProvider.toggleTheme(value);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: children[currentIndex],
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        color: themeProvider.isDarkMode ? kGrey : kPrimaryColor,
        child: BottomNavigationBar(
          elevation: 0.0,
          type: BottomNavigationBarType.shifting,
          backgroundColor: themeProvider.isDarkMode ? kGrey : kPrimaryColor,
          currentIndex: currentIndex,
          onTap: onTabTapped,
          selectedItemColor: kWhite,
          unselectedItemColor: kWhite.withOpacity(0.6),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.watch_later),
              label: 'Programma',
              backgroundColor: themeProvider.isDarkMode ? kGrey : kPrimaryColor,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.archive),
              label: 'Risorse',
              backgroundColor: themeProvider.isDarkMode ? kGrey : kPrimaryColor,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.library_music),
              label: 'Cantici',
              backgroundColor: themeProvider.isDarkMode ? kGrey : kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
