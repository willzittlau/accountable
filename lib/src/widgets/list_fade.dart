import 'package:flutter/material.dart';

class ListFade extends StatelessWidget {

    final Widget child;

  ListFade({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ShaderMask(
            shaderCallback: (Rect rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black
                ],
                stops: [
                  0.0,
                  0.05,
                  0.95,
                  1.0
                ], // 5% black, 90% transparent, 5% black
              ).createShader(rect);
            },
            blendMode: BlendMode.dstOut,
            child: child));
  }
}
