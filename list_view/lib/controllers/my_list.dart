import 'package:flutter/material.dart';
import '../models/list_item.dart';

// Represents the amount of time we should wait until our fake web service
// takes to respond.
const fakeDelayDuration = Duration(milliseconds: 5000);

// Represents a StatefulWidget, which will hold nothing but our state,
// defined below.
class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

// Represents the state, which in Flutter, does three main things:
//
// 1. Stores data as state via its members.
// 2. Contains our rendering logic via the build() method.
// 3. Provides a setState() method, allowing us to trigger build().
class _MyListState extends State<MyList> {
  List<ListItem> items = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My List")),
      body: Column(
          children: [renderStatusMessage(), Expanded(child: renderListView())]),
    );
  }

  void fetchData() async {
    if (this.mounted) {
      // we need to invoke setState here as it will trigger the build()
      // method of our UI
      setState(() => this.loading = true);

      // fetch our items in a delayed manner
      //
      // NOTE: Flutter's Hot Reload and Hot Restart will not simulate this
      // delay if the data has already been loaded and therefore cached
      // on screen. You'll have to fully stop then start the app to
      // simulate this.
      final items = await ListItem.fetchFakeDataWithDuration(fakeDelayDuration);

      // setState again, updating our UI
      setState(() {
        this.items = items;
        this.loading = false;
      });
    }
  }

  Widget renderStatusMessage() {
    return loading
        ? Container(padding: EdgeInsets.all(5.0), child: Text("Loading..."))
        : Container();
  }

  Widget renderListView() {
    return ListView.builder(
      itemCount: this.items.length,
      itemBuilder: listViewItemBuilder,
    );
  }

  Widget listViewItemBuilder(BuildContext context, int index) {
    return ListTile(
      contentPadding: EdgeInsets.all(5.0),
      title: renderListViewItemTitle(items[index].title),
    );
  }

  Widget renderListViewItemTitle(String title) {
    return Text("Item '$title'");
  }
}
