import 'package:accountable/src/widgets/app_bar_title.dart';
import 'package:flutter/material.dart';

// Screen Header
class EditHabitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: AppBarTitle(
            title: 'change it up.', subtitle: 'edit the current habit'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.keyboard_return,
                  color: Theme.of(context).hintColor),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      body: Center(child: EditHabitPage()),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Add a habit',
          child: Icon(Icons.delete_outline)),
    );
  }
}

// Screen Content
class EditHabitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: 800, minHeight: constraints.maxHeight),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[])));
    });
  }
}
