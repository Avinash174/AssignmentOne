import 'package:assignment_one/screens/sign_screen/land.screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _handleSignOut() {
    _signOut().then((user) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const LandingScreen()));
    });
  }

  _signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
          
              children: [
                TextButton(
                    onPressed: () {
                      _handleSignOut();
                    },
                    child: const Text(
                      'Chal Nikal-lodiyan',
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
