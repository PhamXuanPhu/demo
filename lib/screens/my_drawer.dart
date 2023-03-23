import 'package:conasi/screens/customer_screen.dart';
import 'package:conasi/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              color: Colors.blue,
              child: const Text(
                'App Shell',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(HomeScreen.id),
              child: const ListTile(
                leading: Icon(Icons.folder),
                title: Text('Home'),
                trailing: Text('0'),
              ),
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(CustomerScreen.id),
              child: const ListTile(
                leading: Icon(Icons.delete),
                title: Text('Customer'),
                trailing: Text('0'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
