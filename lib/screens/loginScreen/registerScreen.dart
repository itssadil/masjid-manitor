import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:masjid_tv/providers/stepperProvider.dart';
import 'package:masjid_tv/screens/loginScreen/loginUi/loginUi.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<StepperProvider>(
            builder: (context, value, child) {
              return Stepper(
                currentStep: value.currentStep,
                onStepContinue: () {
                  final isLastStep = value.currentStep ==
                      getStep(value.currentStep).length - 1;
                  if (isLastStep) {
                  } else {
                    value.continueStep();
                  }
                },
                onStepCancel: () {
                  value.currentStep == 0 ? null : value.cancelStep();
                },
                controlsBuilder: (context, details) {
                  final isLastStep = value.currentStep ==
                      getStep(value.currentStep).length - 1;
                  return Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (FirebaseAuth.instance.currentUser != null)
                              details.onStepContinue!();
                          },
                          child: Text(
                            isLastStep ? "Conferm" : "Next",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                        ),
                        SizedBox(width: 10),
                        if (value.currentStep != 0)
                          ElevatedButton(
                            onPressed: details.onStepCancel,
                            child: Text("Back"),
                          ),
                      ],
                    ),
                  );
                },
                steps: getStep(value.currentStep),
              );
            },
          ),
        ),
      ),
    );
  }

  List<Step> getStep([currentStep]) {
    return [
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: Text("Account"),
        content: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return Column(
                children: [
                  snapshot.data!.photoURL != null
                      ? CircleAvatar(
                          backgroundImage:
                              NetworkImage(snapshot.data!.photoURL!),
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
              return LogInUi(
                alignment: Alignment.topLeft,
                isLoginPage: false,
              );
            }
          },
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: Text("Address"),
        content: Container(),
      ),
      Step(
        isActive: currentStep >= 2,
        title: Text("Complete"),
        content: Container(),
      ),
    ];
  }

  textStyle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.grey.shade700,
    );
  }
}
