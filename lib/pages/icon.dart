import 'package:flutter/material.dart';

void main() {
  runApp(AppIcons());
}

class AppIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Icon Rotation Example'),
        ),
        body: Center(
          child: MyAnimatedIcon(),
        ),
      ),
    );
  }
}

class MyAnimatedIcon extends StatefulWidget {
  @override
  _MyAnimatedIconState createState() => _MyAnimatedIconState();
}

class _MyAnimatedIconState extends State<MyAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          
        });
        if (_controller.isCompleted) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      },
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 0.25).animate(_controller),
        child: Icon(
          Icons.arrow_forward,
          size: 50,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}