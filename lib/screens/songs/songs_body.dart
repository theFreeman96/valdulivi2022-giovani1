import 'package:flutter/material.dart';

import '/theme/constants.dart';
import '/assets/data/queries.dart';
import '/assets/data/models.dart';

import 'songs_detail.dart';

class SongsBody extends StatefulWidget {
  const SongsBody({Key? key}) : super(key: key);

  @override
  State<SongsBody> createState() => _SongsBodyState();
}

class _SongsBodyState extends State<SongsBody> {
  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FutureBuilder<List?>(
          future: QueryCtr().getAllSongs(),
          initialData: const [],
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Expanded(
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: ListView.separated(
                        padding: const EdgeInsets.only(
                            top: kDefaultPadding, bottom: kDefaultPadding),
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, i) {
                          return _buildRow(snapshot.data![i]);
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                      ),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.only(top: kDefaultPadding),
                    child: Center(
                      child: Text(
                        'Nessun Cantico trovato',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  );
          },
        ),
      ],
    );
  }

  Widget _buildRow(Songs get) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
          left: kDefaultPadding * 2, right: kDefaultPadding * 2),
      leading: CircleAvatar(
        child: Text(
          get.id.toString(),
        ),
      ),
      title: Text(get.title),
      trailing: const Icon(
        Icons.navigate_next,
        color: kLightGrey,
      ),
      onTap: () {
        FocusScope.of(context).unfocus();
        int songId = get.id;
        String songTitle = get.title;
        String songText = get.text;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SongsDetail(songId, songTitle, songText);
            },
          ),
        );
      },
    );
  }
}
