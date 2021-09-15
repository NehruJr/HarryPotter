import 'package:flutter/material.dart';
import 'package:hp/constants.dart';
import 'components//body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }
 AppBar buildAppBar(){
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: Container(
        height: 100,
        width: 160,
        padding: const EdgeInsets.only(left: kDefaultPadding,top: kDefaultPadding),
        child: Image.asset('assets/images/hpLogo.png' ,),
      ),
    );
  }
}
