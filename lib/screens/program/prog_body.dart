import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/theme/constants.dart';
import '/theme/provider.dart';

class ProgBody extends StatefulWidget {
  const ProgBody({Key? key}) : super(key: key);

  @override
  State<ProgBody> createState() => _ProgBodyState();
}

class _ProgBodyState extends State<ProgBody> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding * 2),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CircleAvatar(child: Icon(Icons.watch_later)),
                  Text(
                    'Programma Giornaliero',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              const Divider(),
              Table(
                border: TableBorder(
                  horizontalInside: BorderSide(
                      style: BorderStyle.solid,
                      color: themeProvider.isDarkMode
                          ? kLighterGray
                          : kLighterGray),
                ),
                columnWidths: const {
                  0: FractionColumnWidth(0.60),
                  1: FractionColumnWidth(0.40)
                },
                children: [
                  buildRow(['Sveglia', '08:00']),
                  buildRow(['Cerchio', '08:45']),
                  buildRow(['Colazione', '09:00']),
                  buildRow(['Pulizie', '09:30']),
                  buildRow(['Studio Biblico', '11:00']),
                  buildRow(['Pranzo', '13:00']),
                  buildRow(['Riposo', '14:30']),
                  buildRow(['Giochi', '16:00']),
                  buildRow(['Merenda', '17:30']),
                  buildRow(['Culto', '18:30']),
                  buildRow(['Cena', '20:30']),
                  buildRow(['Cerchio', '23:30']),
                  buildRow(['Silenzio', '24:00']),
                ],
              ),
              const Divider(),
              const Text(
                'La domenica il culto si terrà alle h. 17:00 e la cena alle h. 19:30',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildRow(List<String> cells) => TableRow(
          children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Center(
            child: Text(cell),
          ),
        );
      }).toList());
}
