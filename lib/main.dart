import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '/theme/provider.dart';
import '/theme/themes.dart';

import '/screens/home.dart';

void main() {
  runApp(
    const Valdulivi2022Giovani1(),
  );
}

class Valdulivi2022Giovani1 extends StatelessWidget {
  const Valdulivi2022Giovani1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, ThemeProvider themeProvider, child) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themeProvider.isDarkMode
                  ? MyTheme.darkTheme
                  : MyTheme.lightTheme,
              title: 'Inni di Lode',
              builder: (context, child) {
                return ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: SizedBox(child: child),
                );
              },
              home: const SafeArea(
                child: Home(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
