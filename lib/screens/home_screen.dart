import 'package:conasi/base/base_screen.dart';
import 'package:conasi/resource/colors.dart';
import 'package:flutter/material.dart';

// class HomeScreen extends BasePageScreen {
//   const HomeScreen({Key? key}) : super(key: key);
//   static const id = 'home_screen';

//   @override
//   // ignore: library_private_types_in_public_api
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends BasePageScreenState<HomeScreen> with BaseScreen {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   String appBarTitle() {
//     return "Home";
//   }

//   @override
//   Widget body() {
//     return Container(
//       color: colorRed,
//     );
//   }
// }
class HomeScreen extends BaseScreen {
  const HomeScreen({Key? key}) : super(key: key);
  static const id = 'home_screen';

  @override
  String appBarTitle() {
    return "Home";
  }

  @override
  Widget body() {
    return Container(
      color: colorRed,
    );
  }
}
