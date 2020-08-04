import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item);

class ListItemsBuilder<T> extends StatelessWidget {
  const ListItemsBuilder({@required this.snapshot, @required this.itemBuilder});

  final AsyncSnapshot<List<T>> snapshot;
  final ItemWidgetBuilder<T> itemBuilder;

  @override
  Widget build(BuildContext context) {
    if (snapshot.hasData) {
      final List<T> items = snapshot.data;
      if (items.isNotEmpty) {
        return _builtList(items);
      } else {
        return SizedBox();
      }
    } else if (snapshot.hasError) {
      return SizedBox();
    }
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _builtList(List<T> items) {
    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) => itemBuilder(context, items[index]),
      separatorBuilder: (context, index) => SizedBox(
        height: 10,
      ),
    );
  }
}
