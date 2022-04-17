import 'dart:developer';
import 'package:flutter/material.dart';

class RouteDetector extends StatefulWidget {
  final Widget child;
  final String? routeName;
  final RouteObserver<PageRoute<dynamic>> routeObserver;
  final Function()? onLeaveScreen, onShowingScreen;
  final bool showLogs;
  const RouteDetector({
    Key? key,
    //* A [Navigator] observer that notifies [RouteAware]s of changes to the state of their [Route].
    required this.routeObserver,

    //*Your Class that will be in route detection mode
    required this.child,

    //* Your route name or class name, it just an identifier to your class
    this.routeName,

    //* A Function that called when you navigate out the observed screen
    this.onLeaveScreen,

    //* A Function that called when you init or back to the observed screen
    this.onShowingScreen,

    //* A Logger for logging the screen status in your debug console
    this.showLogs = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RouteDetectorState();
  }
}

class RouteDetectorState extends State<RouteDetector> with RouteAware {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _onLeaveScreen() {
    if (widget.onLeaveScreen != null) {
      widget.onLeaveScreen!();
    }
    return;
  }

  void _onShowingScreen() {
    if (widget.onShowingScreen != null) {
      widget.onShowingScreen!();
    }
    return;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.routeObserver.subscribe(this, ModalRoute.of(context)! as PageRoute);
  }

  @override
  void dispose() {
    super.dispose();
    widget.routeObserver.unsubscribe(this);
  }

  @override
  //* Called when the current route has been pushed.
  void didPush() {
    if (widget.showLogs) {
      log('- Entering screen: ${widget.routeName ?? widget.child.runtimeType} -');
    }
    _onShowingScreen();
  }

  @override
  //* Called when a new route has been pushed, and the current route is no longer visible.
  void didPushNext() {
    if (widget.showLogs) {
      log('- Leaving screen: ${widget.routeName ?? widget.child.runtimeType} -');
    }
    _onLeaveScreen();
  }

  @override
  //* Called when the current route has been popped off.
  void didPop() {
    if (widget.showLogs) {
      log('- Going back, leaving screen: ${widget.routeName ?? widget.child.runtimeType} -');
    }
    _onLeaveScreen();
  }

  @override
  //* Called when the top route has been popped off, and the current route shows up.
  void didPopNext() {
    if (widget.showLogs) {
      log('- Going back to screen: ${widget.routeName ?? widget.child.runtimeType} -');
    }
    _onShowingScreen();
  }
}
