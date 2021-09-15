import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../constants.dart';

class OfflineScreen extends StatelessWidget {
  const OfflineScreen({Key? key, required this.widget}) : super(key: key);
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          return widget;
        } else {
          return buildNoInternetWidget();
        }
      },
      child: const Center(
        child: CircularProgressIndicator(
          color: kPrimaryColor,
        ),
      ),
    );
  }

  Widget buildNoInternetWidget() {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Please Check Your Internet Connection ...',
              style: TextStyle(fontSize: 20, color: kPrimaryColor),
            ),
            Image.asset('assets/images/notConnected.png'),
          ],
        ),
      ),
    );
  }
}
