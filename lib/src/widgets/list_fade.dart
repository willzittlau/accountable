import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

class ListFade extends StatelessWidget {
  final Widget child;

  ListFade({this.child});

  @override
  Widget build(BuildContext context) {
    if (!UniversalPlatform.isWeb) {
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
                    0.03,
                    0.97,
                    1.0
                  ], // 5% black, 90% transparent, 5% black
                ).createShader(rect);
              },
              blendMode: BlendMode.dstOut,
              child: child));
    } else {
      return Container(child: child);
    }
  }
}
