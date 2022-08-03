import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '/theme/constants.dart';

class ResBody extends StatefulWidget {
  const ResBody({Key? key}) : super(key: key);

  @override
  State<ResBody> createState() => _ResBodyState();
}

class _ResBodyState extends State<ResBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          Link(
            uri: Uri.parse(
                'https://www.ccec.it/valdulivi/giovani1/studio/index.html'),
            target: LinkTarget.self,
            builder: (context, followLink) => Card(
              elevation: 3.0,
              margin: const EdgeInsets.all(kDefaultPadding),
              child: ListTile(
                leading: Image.asset(
                  'lib/assets/images/book.png',
                  fit: BoxFit.cover,
                  height: 100.0,
                ),
                title: const Text(
                  'Studi Biblici',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      'Tutti gli Studi del turno',
                      style: TextStyle(
                          fontSize: 13.0, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                //trailing: ,
                onTap: followLink,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
