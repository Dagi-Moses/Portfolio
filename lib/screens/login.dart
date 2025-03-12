import 'package:Dagi_Moses_Portfolio/auth/authProvider.dart';
import 'package:Dagi_Moses_Portfolio/classes/fadeanimation.dart';
import 'package:Dagi_Moses_Portfolio/screens/forgot_password.dart';
import 'package:Dagi_Moses_Portfolio/screens/signup.dart';
import 'package:Dagi_Moses_Portfolio/utils/constants.dart';
import 'package:Dagi_Moses_Portfolio/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FormData {
  Email,
  password,
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;
  FormData? selected;
 
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
       final authProvider =
        Provider.of<AuthProvider>(context,);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.1, 0.4, 0.5, 0.7],
            colors: [
              // HexColor("#4b4293").withOpacity(0.8),
              // HexColor("#4b4293"),
              // HexColor("#08418e"),
              // HexColor("#08418e")
              kBackgroundColor.withOpacity(0.8),
              kBackgroundColor,
              kBackgroundColor.withOpacity(0.5),
              kBackgroundColor
            ],
          ),
          // image: DecorationImage(
          //   fit: BoxFit.cover,
          //   colorFilter: ColorFilter.mode(
          //       kBackgroundColor.withOpacity(0.2), BlendMode.dstATop),
          //   image: const NetworkImage(
          //     'https://mir-s3-cdn-cf.behance.net/project_modules/fs/01b4bd84253993.5d56acc35e143.jpg',
          //   ),
          // ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5,
                    color:
                        const Color.fromARGB(255, 171, 211, 250).withOpacity(0.4),
                    child: Container(
                      width: 400,
                      padding: const EdgeInsets.all(40.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FadeAnimation(
                            delay: 0.8,
                            child: Image.network(
                              "https://cdni.iconscout.com/illustration/premium/thumb/job-starting-date-2537382-2146478.png",
                              width: 100,
                              height: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FadeAnimation(
                            delay: 1,
                            child: const Text(
                              "Please sign in to continue",
                              style: TextStyle(
                                  color: Colors.white, letterSpacing: 0.5),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                           CustomTextField(
                          maxLines: 1,
                            controller: emailController,
                            onTap: () {
                              setState(() {
                                selected = FormData.Email;
                              });
                            },
                            isSelected: selected == FormData.Email,
                            hintText: 'Email',
                            prefixIcon: Icons.email_outlined,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }

                              // Email regex for validation
                              final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

                              if (!emailRegex.hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }

                              return null;
                            },

                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                         maxLines: 1,
                            ispasswordev: ispasswordev,
                            controller: passwordController,
                            onTap: () {
                              setState(() {
                                selected = FormData.password;
                              });
                            },
                            isSelected: selected == FormData.password,
                            onToggleVisibility: () =>
                                setState(() => ispasswordev = !ispasswordev),
                            hintText: 'Password',
                            
                            prefixIcon: Icons.lock_open_outlined,
                             validator: (value) {
    if (value == null || value.isEmpty) {
      return 'please input a password';
    }
    return null;
  },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                            delay: 1,
                            child: TextButton(
                            
                               onPressed: authProvider.textButtonLoading
                                  ? null // Disable the button when loading
                                  : () {
                                      if (formKey.currentState!.validate()) {
                                        authProvider.signInWithEmailAndPassword(
                                            context,
                                            emailController.text,
                                            passwordController.text);
                                      }
                                    },
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFF2697FF),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 14.0, horizontal: 80),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                              ),
                              child: authProvider.textButtonLoading
                                  ? const SizedBox(
                                      width:
                                          24, // Set a fixed width for the loading indicator
                                      height:
                                          24, // Set a fixed height for the loading indicator
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(Colors
                                                .white), // Set the color of the loader
                                      ),
                                    )
                                  : const Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 0.5,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
              
                  //End of Center Card
                  //Start of outer card
                  const SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                    delay: 1,
                    child: GestureDetector(
                      onTap: (() {
                        Navigator.pop(context);
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ForgotPasswordScreen();
                        }));
                      }),
                      child: Text("Can't login? use OTP",
                          style: TextStyle(
                            color: Colors.blue.withOpacity(0.9),
                            letterSpacing: 0.5,
                          )),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeAnimation(
                    delay: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Don't have an account? ",
                            style: TextStyle(
                              color: Colors.grey,
                              letterSpacing: 0.5,
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return SignupScreen();
                            }));
                          },
                          child: Text("Sign up",
                              style: TextStyle(
                                  color: Colors.blue.withOpacity(0.9),
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 14)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
