import 'package:flutter/material.dart';

class OptionTile extends StatefulWidget {
  final String option, desc, correctAnswer, optionSelected;

  OptionTile({
    @required this.optionSelected,
    @required this.option,
    @required this.desc,
    @required this.correctAnswer,
  });

  @override
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(
                border: Border.all(
                    color: widget.desc == widget.optionSelected
                        ? widget.optionSelected == widget.correctAnswer
                            ? Colors.green.withOpacity(0.8)
                            : Colors.red.withOpacity(0.9)
                        : Colors.grey,width: 2),
                borderRadius: BorderRadius.circular(30)),
            alignment: Alignment.center,
            child: Text(
              '${widget.option}',
              style: TextStyle(
                  color: widget.optionSelected == widget.desc
                      ? widget.correctAnswer == widget.optionSelected
                          ? Colors.green.withOpacity(0.8)
                          : Colors.red.withOpacity(0.8)
                      : Colors.grey),
            ),
          ),
          SizedBox(width: 10.0),
          Text(
            widget.desc,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
