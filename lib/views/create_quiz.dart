import 'package:flutter/material.dart';
import 'package:quiz_app/services/database.dart';
import 'package:quiz_app/views/addquestion.dart';
import 'package:quiz_app/widgets/widgets.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  String quizURL, quizTitle, quizDescription, quizId;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  DatabaseService databaseService = new DatabaseService();

  createQuiz() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      quizId = randomAlphaNumeric(16);
      Map<String, String> quizData = {
        'id': quizId,
        'uel': quizURL,
        'title': quizTitle,
        'description': quizDescription
      };
      await databaseService.addQuizData(quizData, quizId).then((value) {
        setState(() {
          _isLoading = false;
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AddQuestion(quizId),
              ));
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
      body: _isLoading
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
                        quizURL = val;
                      },
                      validator: (val) =>
                          val.isEmpty ? "Please Enter Image URL" : null,
                      decoration: InputDecoration(hintText: 'Quiz Image URL'),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      onChanged: (val) {
                        quizTitle = val;
                      },
                      validator: (val) =>
                          val.isEmpty ? "Please Enter Quiz Title" : null,
                      decoration: InputDecoration(hintText: 'Quiz Title'),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      onChanged: (val) {
                        quizDescription = val;
                      },
                      validator: (val) =>
                          val.isEmpty ? "Please Enter Description" : null,
                      decoration:
                          InputDecoration(hintText: 'Quiz  Description'),
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          createQuiz();
                        },
                        child:
                            myButton(label: 'Create Quiz', context: context)),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
    );
  }
}
