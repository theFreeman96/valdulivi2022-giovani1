import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/theme/provider.dart';
import '/theme/constants.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: themeProvider.isDarkMode
              ? const AssetImage('lib/assets/images/header_g.png')
              : const AssetImage('lib/assets/images/header_r.png'),
          alignment: Alignment.center,
        ),
        color: themeProvider.isDarkMode ? kGrey : kPrimaryColor,
      ),
    );
  }
}
