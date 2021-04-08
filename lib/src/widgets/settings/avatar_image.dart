import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:accountable/src/providers/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:connectivity/connectivity.dart';

Future<bool> check() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

class AvatarImage extends StatelessWidget {
  final User user;

  AvatarImage({this.user});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: check(),
        builder: (BuildContext context, AsyncSnapshot builder) {
          if (builder.hasData) {
            return builder.data == true
                ? Padding(
                    padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Center(
                      child: user.photoURL != null
                          ? Container(
                              width: 200,
                              height: 200,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: Image.network(
                                  user.photoURL.replaceAll("s96-c", "s384-c"),
                                  fit: BoxFit.fill,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes
                                            : null,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          : Image(
                              height: 200,
                              width: 200,
                              image: context.watch<ThemeNotifier>().isDarkMode
                                  ? AssetImage('assets/img/logo.png')
                                  : AssetImage('assets/img/logo-light.png'),
                            ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Center(
                      child: Image(
                        height: 200,
                        width: 200,
                        image: context.watch<ThemeNotifier>().isDarkMode
                            ? AssetImage('assets/img/logo.png')
                            : AssetImage('assets/img/logo-light.png'),
                      ),
                    ),
                  );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
