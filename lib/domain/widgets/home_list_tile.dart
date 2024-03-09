import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';


class HomeListTile extends StatefulWidget {
  HomeListTile({
    Key? key,
    this.title,
    this.icon,
    this.needProgress = true,
  });

  final title;
  final icon;
  bool needProgress;

  @override
  State<HomeListTile> createState() => _HomeListTileState();
}

class _HomeListTileState extends State<HomeListTile> {

  int step = 0;

  Widget progress(){
    if(widget.needProgress == true){
      return CircularStepProgressIndicator(
        totalSteps: 25,
        currentStep: 10,
        stepSize: 7,
        selectedColor: Colors.white,
        unselectedColor: Colors.grey,
        padding: 0,
        width: 30,
        height: 30,
        roundedCap: (_, __) => true,
      );
    }else{
      return const SizedBox(width: 20,);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        progress(),
        Icon(widget.icon,
          color: Colors.white30,
          size: 48,),
        const Flexible(
          child: SizedBox(
            width: 40,
          ),
        ),
        Text(widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),)
      ],
    );
  }
}
