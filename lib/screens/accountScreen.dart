import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:masjid_tv/providers/stepperProvider.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<StepperProvider>(
        builder: (context, value, child) {
          return Stepper(
            currentStep: value.currentStep,
            onStepContinue: () {
              final isLastStep =
                  value.currentStep == getStep(value.currentStep).length - 1;
              if (isLastStep) {
              } else {
                value.continueStep();
              }
            },
            onStepCancel: () {
              value.currentStep == 0 ? null : value.cancelStep();
            },
            controlsBuilder: (context, details) {
              final isLastStep =
                  value.currentStep == getStep(value.currentStep).length - 1;
              return Container(
                margin: EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: details.onStepContinue,
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
    );
  }

  List<Step> getStep([currentStep]) => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text("Account"),
          content: Center(
            child: ElevatedButton(
              child: Text(
                "Sign in with Google",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => GoogleSignIn().signIn(),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
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
