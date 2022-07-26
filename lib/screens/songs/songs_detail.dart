import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// HTML renderers
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '/theme/constants.dart';
import '/theme/provider.dart';

class SongsDetail extends StatefulWidget {
  final int songId;
  final String songTitle;
  final String songText;
  const SongsDetail(this.songId, this.songTitle, this.songText);

  @override
  State<SongsDetail> createState() =>
      _SongsDetailState(songId, songTitle, songText);
}

class _SongsDetailState extends State<SongsDetail> {
  final int songId;
  final String songTitle;
  final String songText;

  _SongsDetailState(this.songId, this.songTitle, this.songText);

  get songNumber => songId.toString().padLeft(3, '0');

  late String title = songTitle;
  RegExp exp = RegExp(
      r'[^\p{Alphabetic}\p{Mark}\p{Decimal_Number}\p{Connector_Punctuation}\p{Join_Control}\s]+',
      unicode: true,
      multiLine: true,
      caseSensitive: true);
  late String parsedTitle = title.replaceAll(exp, '');

  double textSize = 16.0;
  double textSizeMin = 16.0;
  double textSizeMax = 20.0;

  double textHeight = 1.5;
  double textHeightMin = 1.0;
  double textHeightMax = 2.0;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          elevation: 0.0,
          title: const Text('Dettaglio'),
          leading: IconButton(
            tooltip: 'Indietro',
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              FocusScope.of(context).unfocus();
              Navigator.of(context).pop();
            },
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: kDefaultPadding, right: kDefaultPadding),
              child: Row(
                children: [
                  Icon(
                    themeProvider.isDarkMode
                        ? Icons.dark_mode
                        : Icons.light_mode,
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
        floatingActionButton: IconButton(
          icon: const Icon(Icons.settings),
          tooltip: 'Impostazioni',
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              isScrollControlled: true,
              builder: (BuildContext context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.format_size),
                      title: const Text('Dimensione Testo'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.text_decrease),
                            tooltip: 'Testo più Piccolo',
                            onPressed: () {
                              if (textSize > textSizeMin) {
                                textSize = textSize - 2.0;
                              } else {
                                log('Dimensione minima del testo: $textSize');
                              }
                              setState(
                                () {},
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.text_increase),
                            tooltip: 'Testo più Grande',
                            onPressed: () {
                              if (textSize < textSizeMax) {
                                textSize = textSize + 2.0;
                              } else {
                                log('Dimensione massima del testo: $textSize');
                              }
                              setState(
                                () {},
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.format_line_spacing),
                      title: const Text('Interlinea'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.density_small,
                            ),
                            tooltip: 'Diminuisci Interlinea',
                            onPressed: () {
                              if (textHeight > textHeightMin) {
                                textHeight = textHeight - 0.5;
                              } else {
                                log('Interlinea minima: $textHeight');
                              }
                              setState(
                                () {},
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.density_medium,
                            ),
                            tooltip: 'Aumenta Interlinea',
                            onPressed: () {
                              if (textHeight < textHeightMax) {
                                textHeight = textHeight + 0.5;
                              } else {
                                log('Interlinea massima: $textHeight');
                              }
                              setState(
                                () {},
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Center(
                        child: Text('Chiudi'),
                      ),
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: CircleAvatar(
                    child: Text(
                      songId.toString(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: kDefaultPadding),
                  child: Text(
                    songTitle,
                    style: const TextStyle(fontSize: 22.0),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                    bottom: kDefaultPadding * 7,
                  ),
                  child: HtmlWidget(
                    songText,
                    textStyle: TextStyle(
                      fontSize: textSize,
                      height: textHeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding),
            child: Row(
              children: const [
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
