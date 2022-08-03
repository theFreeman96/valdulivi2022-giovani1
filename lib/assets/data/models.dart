class Songs {
  late int id;
  late String title;
  late String text;

  Songs.fromMap(dynamic obj) {
    id = obj['id'];
    title = obj['title'];
    text = obj['text'];
  }
}
