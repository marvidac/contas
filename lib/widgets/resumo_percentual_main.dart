import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ResumoPercentualMain extends StatefulWidget {
  final double percentual;
  final String title;

  const ResumoPercentualMain(this.title,this.percentual);

  @override
  _ResumoPercentualMainState createState() => _ResumoPercentualMainState();
}

class _ResumoPercentualMainState extends State<ResumoPercentualMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: MediaQuery.of(context).size.height/5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularPercentIndicator(
                radius: 100.0,
                lineWidth: 10.0,
                percent: widget.percentual,
                header: new Text(widget.title, style: TextStyle(fontSize: 18),),
                center: Text( (widget.percentual*100).toString()+"%", style: TextStyle(
                  fontSize: 18
                ),),
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              )
          ],
        ),
      ),
    );
  }
}