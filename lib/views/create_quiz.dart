import 'package:flutter/material.dart';
import 'package:quizmaker/widgets/widgets.dart';
import 'package:random_string/random_string.dart';
import '../services/database.dart';
import 'add_questions.dart';

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  String imgUrl, title, description, quizId;
  final _formkey = GlobalKey<FormState>();
  bool _isLoading = false;
  DatabaseService databaseService = DatabaseService();

  createQuizOnline() async {
    if (_formkey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      quizId = randomAlphaNumeric(16);
      Map<String, String> quizMap = {
        "quizId": quizId,
        "imgUrl": imgUrl,
        "quizTitle": title,
        "quizDescription": description,
      };
      await databaseService.addQuizData(quizMap, quizId).then(
        (_) {
          setState(() {
            _isLoading = false;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AddQuestions(quizId),
              ),
            );
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formkey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "Enter Image URL" : null,
                      decoration: InputDecoration(
                        hintText: "Quiz Image URL",
                      ),
                      onChanged: (value) {
                        imgUrl = value;
                      },
                    ),
                    SizedBox(height: 6),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "Enter Quiz Title" : null,
                      decoration: InputDecoration(
                        hintText: "Quiz Title",
                      ),
                      onChanged: (value) {
                        title = value;
                      },
                    ),
                    SizedBox(height: 6),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "Enter Quiz Description" : null,
                      decoration: InputDecoration(
                        hintText: "Quiz Description",
                      ),
                      onChanged: (value) {
                        description = value;
                      },
                    ),
                    Spacer(),
                    GestureDetector(
                      child: blueButton(context: context, label: "Create Quiz"),
                      onTap: () {
                        createQuizOnline();
                      },
                    ),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ),
    );
  }
}
