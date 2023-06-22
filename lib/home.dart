import 'dart:math';
import 'package:bmi_calculator_provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var providerC = Provider.of<ProviderC>(context);

    double result = providerC.weight / (pow(providerC.height / 100, 2));

    return Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20 + AppBar().preferredSize.height, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Gender Picker
              Text(
                "Gender",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: providerC.color),
              ),

              const SizedBox(height: 15),
              Row(
                children: [
                  // Male Cards
                  Expanded(
                    child: GestureDetector(
                      onTap: () => providerC.isMale = true,
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: providerC.maleColor, width: 5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/icon_male.png",
                              width: 50,
                              height: 50,
                              color: providerC.maleColor,
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: providerC.maleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 50),
                  // Female Cards
                  Expanded(
                    child: GestureDetector(
                      onTap: () => providerC.isMale = false,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: providerC.femaleColor, width: 5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/icon_female.png",
                              width: 50,
                              height: 50,
                              color: providerC.femaleColor,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: providerC.femaleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              // Weight
              Text(
                "Weight (Kg)",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: providerC.color,
                ),
              ),

              const SizedBox(height: 15),
              // Weight Slider
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: providerC.color, width: 5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Slider(
                  thumbColor: providerC.color,
                  activeColor: providerC.color,
                  inactiveColor: Colors.grey,
                  divisions: 200,
                  label: providerC.weight.round().toString(),
                  min: 1,
                  max: 200,
                  value: providerC.weight,
                  onChanged: (newValue) {
                    newValue = newValue.roundToDouble();
                    providerC.weight = newValue;
                  },
                ),
              ),

              const SizedBox(height: 50),
              // Height
              Text(
                "Height (Cm)",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: providerC.color),
              ),

              const SizedBox(height: 15),
              // Height Slider
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: providerC.color, width: 5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Slider(
                  thumbColor: providerC.color,
                  activeColor: providerC.color,
                  inactiveColor: Colors.grey,
                  divisions: 300,
                  label: providerC.height.round().toString(),
                  min: 1,
                  max: 300,
                  value: providerC.height,
                  onChanged: (newValue) {
                    newValue = newValue.roundToDouble();
                    providerC.height = newValue;
                  },
                ),
              ),

              const SizedBox(height: 50),
              // BMI Text
              Text(
                "Your BMI:",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: providerC.color,
                ),
              ),
              const SizedBox(height: 15),
              // BMI Result
              Text(
                (result.toStringAsFixed(2)),
                style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: providerC.color),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
