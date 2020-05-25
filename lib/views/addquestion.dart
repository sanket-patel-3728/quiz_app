import 'package:flutter/material.dart';
import 'package:quiz_app/services/database.dart';
import 'package:quiz_app/widgets/widgets.dart';

class AddQuestion extends StatefulWidget {
  final String quizId;

  AddQuestion(this.quizId);

  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formKey = GlobalKey<FormState>();
  String option1, option2, option3, option4, question;
  bool _isLoding = false;
  DatabaseService databaseService = DatabaseService();

  uploadQuestionData() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoding = true;
      });
      Map<String, String> questionData = {
        'question': question,
        'option1': option1,
        'option2': option2,
        'option3': option3,
        'option4': option4,
      };
      await databaseService
          .addQuestionData(questionData, widget.quizId)
          .then((value) {
        setState(() {
          _isLoding = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: _isLoding
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onChanged: (val) {
                        question = val;
                      },
                      validator: (val) =>
                          val.isEmpty ? "Please Enter Question" : null,
                      decoration: InputDecoration(hintText: 'Question'),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      onChanged: (val) {
                        option1 = val;
                      },
                      validator: (val) =>
                          val.isEmpty ? "Please Enter Option 1" : null,
                      decoration: InputDecoration(
                          hintText: 'Option 1 (Correct Answer)'),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      onChanged: (val) {
                        option2 = val;
                      },
                      validator: (val) =>
                          val.isEmpty ? "Please Enter Option 2" : null,
                      decoration: InputDecoration(hintText: 'Option 2'),
                    ),
                    TextFormField(
                      onChanged: (val) {
                        option3 = val;
                      },
                      validator: (val) =>
                          val.isEmpty ? "Please Enter Option 3" : null,
                      decoration: InputDecoration(hintText: 'Option 3'),
                    ),
                    TextFormField(
                      onChanged: (val) {
                        option4 = val;
                      },
                      validator: (val) =>
                          val.isEmpty ? "Please Enter Option 4" : null,
                      decoration: InputDecoration(hintText: 'Option 4'),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: myButton(
                              context: context,
                              label: 'Submit',
                              buttonWidth:
                                  MediaQuery.of(context).size.width / 2 - 36),
                        ),
                        SizedBox(width: 5.0),
                        GestureDetector(
                          onTap: () {
                            uploadQuestionData();
                          },
                          child: myButton(
                              context: context,
                              label: 'Add Question',
                              buttonWidth:
                                  MediaQuery.of(context).size.width / 2 - 30),
                        ),
                      ],
                    ),
                    SizedBox(height: 30)
                  ],
                ),
              ),
            ),
    );
  }
}
