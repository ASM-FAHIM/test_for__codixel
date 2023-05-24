import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class LoadingAnimation extends StatefulWidget {
  final Function onFetchComplete; // Callback function when data fetching is complete

  const LoadingAnimation({required this.onFetchComplete});

  @override
  _LoadingAnimationState createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> {
  Artboard? _riveArtboard;
  RiveAnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _loadRiveFile();
  }

  void _loadRiveFile() async {
    final data = await rootBundle.load('assets/loading_new.riv');
    final file = RiveFile.import(data);
      setState(() {
        _riveArtboard = file.mainArtboard;
        _controller = SimpleAnimation('loading');
        _riveArtboard!.addController(_controller!);
      });
      widget.onFetchComplete(); // Call the callback function to notify data fetching is complete
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_riveArtboard == null) {
      return CircularProgressIndicator();
    }
    return Rive(
      artboard: _riveArtboard!,
      fit: BoxFit.cover,
    );
  }
}