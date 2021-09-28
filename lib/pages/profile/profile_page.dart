import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  child: Image.asset(
                    'assets/images/profile.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Sittidet Pawutinan',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline1,
                    ),
                    Text(
                      'pawutinan_s@silpakorn.edu',
                      style: TextStyle(fontSize: 20.0),
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
