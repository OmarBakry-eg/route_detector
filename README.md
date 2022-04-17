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


```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.