import 'package:flutter/material.dart';
import 'package:shared_code/models/user.dart';

class WelcomePage extends StatelessWidget {
  final List<User> users;

  const WelcomePage({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the App!'),
            SizedBox(height: 20),
            Text('List of Users:'),
            Column(
              children: users.map((user) {
                return ListTile(
                  title: Text('ID: ${user.id}'),
                  subtitle: Text('Username: ${user.username}\nEmail: ${user.email}'),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
