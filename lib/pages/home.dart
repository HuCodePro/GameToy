// Suggested code may be subject to a license. Learn more: ~LicenseLog:3929097939.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2513922151.
import 'package:flutter/material.dart';
import 'package:myapp/games/TicTacToe/TicTacToe.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(180, 173, 108, 1),
              ),
              child: Text('Nos jeux'),
            ),
            ListTile(
              leading: Icon(
                Icons.gamepad_rounded,
              ),
              title: const Text('Tic Tac Toe'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2122910322.
                  return TicTacToeGame();
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2122910322.
                }));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.games_outlined,
              ),
              title: const Text('Fortnite'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
