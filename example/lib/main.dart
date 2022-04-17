import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:route_detector/route_detector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //* Create Your route observer
  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [
        routeObserver
      ], //* Provide it in navigatorObservers List
      home: const MyHomePage(title: 'Flutter Route Detector Example'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return RouteDetector(
      //* Use it
      routeObserver: MyApp.routeObserver,
      routeName: "MyHomePage",
      onLeaveScreen: () {
        Fluttertoast.showToast(msg: "You're leaving the screen");
      },
      onShowingScreen: () {
        Fluttertoast.showToast(msg: "You're showing the screen");
      },
      showLogs: true,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => const NextScreen()));
                },
                icon: const Icon(Icons.arrow_forward_ios))
          ],
          title: Text(title),
        ),
        body: Center(
          child: Text(
            'Screen One',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body: Center(
        child: Text(
          'Screen Two',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
