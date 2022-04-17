# Route Detector

Route Detector is a flutter library for easily observing the navigation route

## Installation

1- Add the latest version of package to your pubspec.yaml.

```bash
dependencies:
 route_detector: - latest version -
```
2- Import the package and use it in your Flutter App.

```bash
import 'package:route_detector/route_detector.dart';
```
## Usage

```bash 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //* Create Your route observer
  static final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>(); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [routeObserver], //* Provide it in navigatorObservers List 
      home: const MyHomePage(title: 'Flutter Route Detector Example'),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return RouteDetector( //* Use it
      routeObserver: MyApp.routeObserver,
      routeName: "MyHomePage",
      onLeaveScreen: (){},
      onShowingScreen: (){},
      showLogs: true,
      child: Scaffold(
        appBar: AppBar(
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


```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.