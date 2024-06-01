import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:masjid_tv/providers/passVisible.dart';
import 'package:masjid_tv/screens/loginScreen/LoginScreen.dart';
import 'package:masjid_tv/screens/loginScreen/registerScreen.dart';
import 'package:masjid_tv/services/googleSignInProvider.dart';
import 'package:masjid_tv/widgets/loginTextField.dart';
import 'package:provider/provider.dart';

class LogInUi extends StatefulWidget {
  LogInUi({Key? key, required this.alignment, required this.isLoginPage})
      : super(key: key);

  final AlignmentGeometry alignment;
  final bool isLoginPage;

  @override
  State<LogInUi> createState() => _LogInUiState();
}

class _LogInUiState extends State<LogInUi> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    // Try sign in

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Pop the loading..

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print(e.code);

      // Pop the loading..
      Navigator.pop(context);

      errorMessage("The email or password is incorrect! Please try again.");
    }
  }

  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    // Try sign up

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        await errorMessage("Password does not match");
      }

      // Pop the loading..

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Pop the loading..

      print(e.code);
      Navigator.pop(context);

      if (e.code == "invalid-email") {
        errorMessage("Please enter a valid email!");
      } else if (e.code == "missing-email") {
        errorMessage("Please enter email!");
      } else if (e.code == "missing-password") {
        errorMessage("Please enter password!");
      } else if (e.code == "weak-password") {
        errorMessage("Weak! Please enter a strong password.");
      } else {
        errorMessage("Something went wrong! Please try again.");
      }
    }
  }

  errorMessage(String message) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.red,
              ),
              SizedBox(width: 10),
              Text(
                "Alert",
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Close")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isPassVisible = Provider.of<PassVisible>(context);
    return Align(
      alignment: widget.alignment,
      child: Column(
        children: [
          Icon(Icons.lock, size: 50),
          SizedBox(height: 20),
          Text(
            widget.isLoginPage
                ? "Welcome back you've been missed!"
                : "Let's create an account for you!",
            style: TextStyle(color: Colors.grey.shade700),
          ),
          SizedBox(height: 10),
          LoginTextField(
            controller: emailController,
            obscureText: false,
            isSuffix: false,
            labelText: "Email",
          ),
          SizedBox(height: 10),
          LoginTextField(
            controller: passwordController,
            obscureText: isPassVisible.isPassVisible,
            isSuffix: true,
            labelText: "Password",
          ),
          Visibility(
            visible: widget.isLoginPage ? false : true,
            child: Column(
              children: [
                SizedBox(height: 10),
                LoginTextField(
                  controller: confirmPasswordController,
                  obscureText: isPassVisible.isPassVisible,
                  isSuffix: false,
                  labelText: "Re-entre Password",
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Visibility(
            visible: widget.isLoginPage ? true : false,
            child: SizedBox(
              width: 400,
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.only(right: 0),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Forgotten Password?",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: widget.isLoginPage ? signUserIn : signUserUp,
            child: Text(
              widget.isLoginPage ? "Login" : "Sign up",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text("OR"),
          SizedBox(height: 10),
          Consumer<GoogleSignInProvider>(
            builder: (context, value, child) {
              return ElevatedButton.icon(
                icon: ImageIcon(
                  AssetImage("assets/images/google.png"),
                  color: Colors.blue.shade700,
                ),
                label: Text(
                  "Sign in with Google",
                  style: TextStyle(color: Colors.blue.shade700),
                ),
                onPressed: () {
                  value.googleLogIn();
                },
              );
            },
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    widget.isLoginPage ? RegisterScreen() : LoginScreen(),
              ),
            ),
            child: Text(
              widget.isLoginPage
                  ? "Need an account? Sign up!"
                  : "Already Have an account?",
              style: const TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
