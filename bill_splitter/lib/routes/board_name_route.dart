import 'package:bill_splitter/utils/navigators.dart';
import 'package:flutter/material.dart';


class BoardNameRoute extends StatefulWidget {

  @override
  State<BoardNameRoute> createState() => _BoardNameRouteState();
}

class _BoardNameRouteState extends State<BoardNameRoute>{
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called,
    // for instance as done by the _incrementCounter method above.

    // Scaffold is another build in app that gives us a standard
    // mobile app layout. You'll most likely use this on every page
    // of your app
    return new Scaffold(
      // the bar accross the top of the app
      appBar: new AppBar(
        // State classes access properties on their
        // parent by calling widget.someProperty
        //  It's easier to think of StatefulWidgets and their corresponding
        // StateClasses as a single Widget.
        title: new Text('Enter Board Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog with the
        // text the user has typed into our text field.
        onPressed: (() => navigateToNewBoard(context, name: myController.text)),
        tooltip: 'Show me the value!',
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}