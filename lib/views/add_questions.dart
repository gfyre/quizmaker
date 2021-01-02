import 'package:flutter/material.dart';
import 'package:quizmaker/widgets/widgets.dart';
import '../services/database.dart';

class AddQuestions extends StatefulWidget {
  final String quizId;
  AddQuestions(this.quizId);
  @override
  _AddQuestionsState createState() => _AddQuestionsState();
}

class _AddQuestionsState extends State<AddQuestions> {
  String question, option1, option2, option3, option4;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  DatabaseService databaseService = DatabaseService();

  uploadQuestionData() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      Map<String, String> questionMap = {
        "question": question,
        "option 1": option1,
        "option 2": option2,
        "option 3": option3,
        "option 4": option4,
      };
      await databaseService
          .addQuestionData(questionMap, widget.quizId)
          .then((value) {
        setState(() {
          _isLoading = false;
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
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          TextFormField(
                            validator: (val) =>
                                val.isEmpty ? "Enter Question" : null,
                            decoration: InputDecoration(
                              hintText: "Question",
                            ),
                            onChanged: (value) {
                              question = value;
                            },
                          ),
                          SizedBox(height: 6),
                          TextFormField(
                            validator: (val) =>
                                val.isEmpty ? "Enter Option 1" : null,
                            decoration: InputDecoration(
                              hintText: "Option 1 (Correct Answer)",
                            ),
                            onChanged: (value) {
                              option1 = value;
                            },
                          ),
                          SizedBox(height: 6),
                          TextFormField(
                            validator: (val) =>
                                val.isEmpty ? "Enter Option 2" : null,
                            decoration: InputDecoration(
                              hintText: "Option 2",
                            ),
                            onChanged: (value) {
                              option2 = value;
                            },
                          ),
                          TextFormField(
                            validator: (val) =>
                                val.isEmpty ? "Enter Option 3" : null,
                            decoration: InputDecoration(
                              hintText: "Option 3",
                            ),
                            onChanged: (value) {
                              option3 = value;
                            },
                          ),
                          TextFormField(
                            validator: (val) =>
                                val.isEmpty ? "Enter Option 4" : null,
                            decoration: InputDecoration(
                              hintText: "Option 4",
                            ),
                            onChanged: (value) {
                              option4 = value;
                            },
                          ),
                          // Spacer(),
                          SizedBox(height: 400),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: blueButton(
                                    context: context,
                                    label: "Submit",
                                    buttonWidth:
                                        MediaQuery.of(context).size.width / 2 -
                                            36),
                              ),
                              SizedBox(width: 24),
                              GestureDetector(
                                onTap: () {
                                  uploadQuestionData();
                                },
                                child: blueButton(
                                    context: context,
                                    label: "Add Question",
                                    buttonWidth:
                                        MediaQuery.of(context).size.width / 2 -
                                            36),
                              ),
                            ],
                          ),
                          // SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
