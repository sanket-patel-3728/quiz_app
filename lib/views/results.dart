import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/widgets.dart';

class Results extends StatefulWidget {
  final correct, incorrect, total;

  Results(
      {@required this.correct, @required this.incorrect, @required this.total});

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${widget.correct}/${widget.total}',
                style: TextStyle(fontSize: 25.0),
              ),
              SizedBox(height: 8),
              Text(
                "Your Answered ${widget.correct} answers correctly  and ${widget.incorrect} answers incorrectly",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: myButton(
                      context: context,
                      label: 'Go To Home',
                      buttonWidth: MediaQuery.of(context).size.width / 2 + 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
