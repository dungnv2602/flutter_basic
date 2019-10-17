import 'package:flutter/material.dart';

class StepperWidget extends StatefulWidget {
  @override
  _StepperWidgetState createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(
          type: StepperType.vertical,
          steps: <Step>[
            Step(
              title: Text("First"),
              subtitle: Text("This is our first article"),
              content: Text(
                  "In this article, I will tell you how to create a page."),
            ),
            Step(
                title: Text("Second"),
                subtitle: Text("Constructor"),
                content: Text("Let's look at its construtor."),
                state: StepState.editing,
                isActive: true),
            Step(
                title: Text("Third"),
                subtitle: Text("Constructor"),
                content: Text("Let's look at its construtor."),
                state: StepState.error),
          ],
          currentStep: _index,
          onStepTapped: (index) {
            setState(() {
              _index = index;
            });
          },
          onStepCancel: () {
            print("You are clicking the cancel button.");
          },
          onStepContinue: () {
            print("You are clicking the continue button.");
          },

          ///If you want to custom your own continue, cancel button, you can use the controlsBuilder to define them. The function is the same as the above. But this time, I will hide these two buttons.
          controlsBuilder: (BuildContext context,
              {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
            return Container();
          }),
    );
  }
}
