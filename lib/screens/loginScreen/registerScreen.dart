import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:masjid_tv/providers/stepperProvider.dart';
import 'package:masjid_tv/providers/textFieldProvider.dart';
import 'package:masjid_tv/screens/loginScreen/loginUi/loginUi.dart';
import 'package:masjid_tv/widgets/customTextField.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final streetController = TextEditingController();
  final unitController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final zipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textFieldProvider =
        Provider.of<TextFieldProvider>(context, listen: false);
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
                            // if (FirebaseAuth.instance.currentUser != null)
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
                steps: getStep(value.currentStep, textFieldProvider),
              );
            },
          ),
        ),
      ),
    );
  }

  List<Step> getStep([currentStep, textFieldProvider]) {
    return [
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text("Account"),
        content: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return Column(
                children: [
                  snapshot.data!.photoURL != null
                      ? CircleAvatar(
                          backgroundImage:
                              NetworkImage(snapshot.data!.photoURL!),
                          radius: 30,
                        )
                      : const CircleAvatar(
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
              return const Text("Something went wrong!");
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
        title: const Text("Details"),
        content: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Consumer<TextFieldProvider>(
                    builder: (context, value, child) {
                      return Padding(
                        padding:
                            EdgeInsets.all(value.textValue != "" ? 10.0 : 0),
                        child: Text(
                          value.textValue,
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  ),
                ),
                CustomTextField(
                  controller: nameController,
                  obscureText: false,
                  labelText: "Enter Masjid Name",
                  isSuffix: false,
                ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: streetController,
                  obscureText: false,
                  labelText: "Street",
                  isSuffix: false,
                  onChanged: (value) {
                    textFieldProvider.changeValue(value, 0);
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: unitController,
                  obscureText: false,
                  labelText: "Flat/apartment/unit etc",
                  isSuffix: false,
                  onChanged: (value) {
                    textFieldProvider.changeValue(value, 1);
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: cityController,
                  obscureText: false,
                  labelText: "City",
                  isSuffix: false,
                  onChanged: (value) {
                    textFieldProvider.changeValue(value, 3);
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: countryController,
                  obscureText: false,
                  labelText: "Country",
                  isSuffix: false,
                  onChanged: (value) {
                    textFieldProvider.changeValue(value, 4);
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: zipController,
                  obscureText: false,
                  labelText: "ZIP code",
                  isSuffix: false,
                  onChanged: (value) {
                    textFieldProvider.changeValue(value, 5);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      Step(
        isActive: currentStep >= 2,
        title: const Text("Complete"),
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
