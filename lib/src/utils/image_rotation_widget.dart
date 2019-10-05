import 'package:flutter/material.dart';

class ImageRotateWidget extends StatefulWidget {
  String image;
  double width;
  double height;
  ImageRotateWidget(this.image, this.width, this.height);
  @override
  _ImageRotateWidgetState createState() => new _ImageRotateWidgetState();
}

class _ImageRotateWidgetState extends State<ImageRotateWidget>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 4),
    );

    animationController.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: new AnimatedBuilder(
        animation: animationController,
        child: new Container(
          height: widget.height,
          width: widget.width,
          child: new Image.asset(widget.image),
        ),
        builder: (BuildContext context, Widget _widget) {
          return new Transform.rotate(
            angle: animationController.value * 12.6,
            child: _widget,
          );
        },
      ),
    );
  }
}