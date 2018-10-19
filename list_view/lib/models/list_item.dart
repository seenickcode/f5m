import 'dart:async';

class ListItem {
  final String title;

  ListItem({this.title});

  // A way to simulate fetching some data from a web service, which
  // may take some time to complete. Useful for testing widgets that
  // compliment "good UX" for async behavior, such as pull to refresh,
  // loading spinners, progress bars, etc.
  //
  // NOTE: Flutter's Hot Reload and Hot Restart will not simulate this
  // delay if the data has already been loaded and therefore cached
  // on screen. You'll have to fully stop then start the app to
  // simulate this.
  static Future<List<ListItem>> fetchFakeDataWithDuration(
      Duration duration) async {
    // we delay here, 'awaiting' it to finish
    await Future.delayed(duration);

    // we return a List wrapped with a Future, since this represents
    // asynchronously fetched data. normally, something like an HTTP
    // response will automatically be wrapped in a Future
    return Future.value([
      ListItem(title: "a"),
      ListItem(title: "b"),
      ListItem(title: "c"),
      ListItem(title: "d"),
      ListItem(title: "e"),
      ListItem(title: "f"),
      ListItem(title: "g"),
      ListItem(title: "h"),
      ListItem(title: "i"),
      ListItem(title: "j"),
      ListItem(title: "k"),
      ListItem(title: "l"),
      ListItem(title: "m"),
      ListItem(title: "n"),
      ListItem(title: "o"),
      ListItem(title: "p"),
      ListItem(title: "q"),
      ListItem(title: "r"),
      ListItem(title: "s"),
      ListItem(title: "t"),
      ListItem(title: "u"),
      ListItem(title: "v"),
      ListItem(title: "w"),
      ListItem(title: "x"),
      ListItem(title: "y"),
      ListItem(title: "z"),
    ]);
  }
}
