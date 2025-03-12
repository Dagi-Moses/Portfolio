import 'package:Dagi_Moses_Portfolio/classes/fadeanimation.dart';
import 'package:Dagi_Moses_Portfolio/screens/addPostScreen.dart';
import 'package:Dagi_Moses_Portfolio/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//write a hello world
void showTopLeftDialog(BuildContext context, VoidCallback onTap) {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final User? currentUser = _auth.currentUser; // Check if the user is signed in

  showDialog(
    context: context,
    barrierDismissible: true, // Allows dismissing by tapping outside the dialog
    builder: (BuildContext context) {
      return Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pop(); // Dismiss the dialog when tapping outside
            },
            child: Container(
              color: Colors
                  .transparent, // Background color for the area outside the dialog
            ),
          ),
          Positioned(
            top: 20,
            left: 20, // Position at the top-left corner
            child: Material(
              color: Colors.white, // Dialog background color
              elevation: 2,
              child: FadeAnimation(
                delay: 1,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return LoginScreen();
                          }));
                        },
                        child: const Text("Login",
                            style: TextStyle(color: Colors.black)),
                      ),
                      const Divider(color: Colors.black, height: 2),

                      if (currentUser != null)...[
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return const AddProjectScreen();
                            }));
                          },
                          child: const Text("Add Project",
                              style: TextStyle(color: Colors.black)),
                        ),],
                      const Divider(color: Colors.black, height: 2),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: onTap,
                        child: const Text("Sign Out",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
