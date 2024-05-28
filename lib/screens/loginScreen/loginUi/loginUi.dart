import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:masjid_tv/services/googleSignInProvider.dart';
import 'package:masjid_tv/widgets/loginTextField.dart';
import 'package:provider/provider.dart';

class LogInUi extends StatelessWidget {
  LogInUi({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return Column(
              children: [
                snapshot.data!.photoURL != null
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(snapshot.data!.photoURL!),
                        radius: 30,
                      )
                    : CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/noProfile.png"),
                        radius: 30,
                      ),
                Text(
                  snapshot.data!.displayName ?? "",
                  style: textStyle(),
                ),
                Text(
                  snapshot.data!.email!,
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("Something went wrong!");
          } else {
            return Column(
              children: [
                Icon(Icons.lock, size: 50),
                SizedBox(height: 20),
                Text(
                  "Welcome back you've been missed!",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                SizedBox(height: 10),
                LoginTextField(
                    controller: emailController,
                    obscureText: false,
                    labelText: "Email"),
                SizedBox(height: 10),
                LoginTextField(
                    controller: passwordController,
                    obscureText: true,
                    labelText: "Password"),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: signUserIn,
                  child: Text(
                    "Login",
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
              ],
            );
          }
        },
      ),
    );
  }

  textStyle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.grey.shade700,
    );
  }

  void signUserIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }
}
