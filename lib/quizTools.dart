import 'package:flutter_app2/questions.dart';
class QuizTools {
  int questionNum = 0;
  int index = 0;

  List<Questions> questionList = [
    Questions(questions: '01-1G等于1024bits？', answer: false),
    Questions(questions: '02-1bits等于8bit？', answer: false),
    Questions(questions: '03-http协议有三次握手？', answer: false),
    Questions(questions: '04-expanded组件可以用在column和row以外的组件中？', answer: false),
    Questions(questions: '05-container是一个mutli child组件？', answer: false),
    Questions(questions: '06-hotreload 可以重置变量的值？', answer: false),
  ];
  String getQuestion(){
    return questionList[questionNum].questions;
  }
  int getQuestionLength(){
    return questionList.length;
  }
  bool getAnswer(){
    return questionList[questionNum].answer;
  }
  //添加了index属性来判断是否结束了答题，在满足index的自增不大于数组长度的条件下，数组脚标_questionNum自增

  void nextQuestion(){
    if (index < questionList.length){
      if (questionNum < questionList.length - 1){
        questionNum++;
      }
      index++;
    }
  }

  bool isFinished() {
    if (index >= questionList.length){
      print('全部问答题已经结束');
      return true;
    } else {
      return false;
    }
  }
  void reset(){
    questionNum = 0;
  }
}
