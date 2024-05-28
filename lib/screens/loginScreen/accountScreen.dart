import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:masjid_tv/providers/stepperProvider.dart';
import 'package:masjid_tv/screens/loginScreen/loginUi/loginUi.dart';
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
        content: LogInUi(),
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
}
