

import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
class Level extends StatefulWidget {
  Level({
    required this.colorOfContainer,
    required this.colorOfUnselectedProgress,
    required this.title,
    required this.subtitle,
    required this.colorOfSubtitle,
    this.onPress,
  });

  final Color colorOfContainer;
  final Color colorOfUnselectedProgress;
  final String title;
  final String subtitle;
  final Color colorOfSubtitle;
  final Function()? onPress;

  @override
  State<Level> createState() => _LevelState();
}

class _LevelState extends State<Level> {
  int _totalSteps = 11;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: widget.onPress,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: widget.colorOfContainer,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  offset: const Offset(-6, 5),
                  blurRadius: 15,
                )
              ]
            ),
            height: 200,
          child: Center(
            child: CircularStepProgressIndicator(
              circularDirection: CircularDirection.counterclockwise,
              totalSteps: _totalSteps,
              currentStep: 2,
              stepSize: 20,
              selectedColor: Colors.white,
              unselectedColor: widget.colorOfUnselectedProgress,
              padding: 0,
              width: 180,
              height: 180,
              roundedCap: (_, __) => true,
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text:widget.title,
                          style: const TextStyle(
                            fontSize: 56,
                            fontFamily: "LEMON MILK Pro FTR Medium",
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const TextSpan(
                          text: '\nزمان باقیمانده\n1 ساعت و 2 دقیقه',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        )
                      ]
                  ),
                )),
            ),
          ),
          ),
          Positioned(
            right: 30,
            bottom: 20,
            child: Text(widget.subtitle,
              style: TextStyle(
                color: widget.colorOfSubtitle,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

        ],
      ),
    );
  }
}