import 'package:conasi/screens/my_drawer.dart';
import 'package:flutter/material.dart';

// abstract class BasePageScreen extends StatefulWidget {
//   const BasePageScreen({Key? key}) : super(key: key);
// }

// abstract class BasePageScreenState<Page extends BasePageScreen>
//     extends State<Page> {
//   String appBarTitle();
//   Widget body();
//   Widget? floatingActionButton() {}
// }

// mixin BaseScreen<Page extends BasePageScreen> on BasePageScreenState<Page> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             appBarTitle(),
//           ),
//         ),
//         drawer: const MyDrawer(),
//         body: body(),
//         floatingActionButton: floatingActionButton());
//   }
// }
abstract class BaseScreen extends StatelessWidget {
  const BaseScreen({Key? key}) : super(key: key);

  String appBarTitle();
  Widget body();
  Widget? floatingActionButton() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            appBarTitle(),
          ),
        ),
        drawer: const MyDrawer(),
        body: body(),
        floatingActionButton: floatingActionButton());
  }
}
