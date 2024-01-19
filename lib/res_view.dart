import 'package:flutter/material.dart';

import 'app_colors.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key, required this.res}) : super(key: key);

  final double res;

  String getClassification() {
    if (res < 16) {
      return 'Severe Thinness';
    } else if (res >= 16 && res < 18.5) {
      return 'Normal';
    } else if (res >= 18.5 && res < 25) {
      return 'Overweight';
    } else if (res >= 25 && res < 35) {
      return 'Obese Class I';
    } else if (res >= 35 && res < 65) {
      return 'Obese Class II';
    } else {
      return 'Obese Class III';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                getClassification(),
                style: TextStyle(color: AppColors.whiteColor, fontSize: 26),
              ),
              SizedBox(height: 35),
              Text(
                res.toStringAsFixed(3),
                style: TextStyle(color: AppColors.whiteColor, fontSize: 26),
              ),
              SizedBox(height: 35),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.redColor,
                    foregroundColor: AppColors.whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('RE_CALCULATE'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
