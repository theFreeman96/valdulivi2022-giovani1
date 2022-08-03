import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/theme/provider.dart';

import '../header.dart';
import 'res_body.dart';

class ResPage extends StatelessWidget {
  const ResPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Orientation orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait) {
      return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.25,
              floating: false,
              pinned: false,
              toolbarHeight: 0.0,
              collapsedHeight: 0.0,
              elevation: 0.0,
              automaticallyImplyLeading: false,
              flexibleSpace: const FlexibleSpaceBar(
                background: Header(),
              ),
            ),
          ];
        },
        body: ResBody(),
      );
    } else {
      return Row(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.height,
            child: const Header(),
          ),
          Expanded(
            child: ResBody(),
          ),
        ],
      );
    }
  }
}
