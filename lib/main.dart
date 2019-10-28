import 'package:flutter/material.dart';
import 'package:flutter_app2/quizTools.dart';
import 'package:rflutter_alert/rflutter_alert.dart';




QuizTools quizTools = QuizTools();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
//   List<String> questions = [
//      '1G等于1024bits？',
//     '1bits等于8bit？',
//     'http协议有三次握手？',
//     'expanded组件可以用在column和row以外的组件中？',
//     'container是一个mutli child组件？',
//     'hotreload 可以重置变量的值？'
//   ];
//   List<bool> answers =[true, true, true, true, false, false];

//   int currentIndex = 0;
//  List<Questions> questionList = [
//   Questions(q:'1G等于1024bits？' ,a:true ),
//   Questions(q: '1bits等于8bit？' ,a:true ),
//   Questions(q:'http协议有三次握手？' ,a: true),
//   Questions(q: 'expanded组件可以用在column和row以外的组件中？',a:true ),
//   Questions(q: 'container是一个mutli child组件？',a:false ),
//   Questions(q: 'hotreload 可以重置变量的值？',a:false ),

//  ]
  List<Widget> answerTrack =[];
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizTools.getAnswer();
    setState(() {
      if (quizTools.isFinished() == true) {
        Alert(context: context, title: '恭喜您!', desc: '已经全部完成').show();
        quizTools.reset();
        answerTrack = [];
      } else {

        if (userPickedAnswer == correctAnswer) {
          answerTrack.add(Icon(
            Icons.check,

            color: Colors.green,
          ));
        } else {
          answerTrack.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizTools.nextQuestion();
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child:Padding(
            padding:EdgeInsets.symmetric(horizontal: 10.0),

            child: Column(
              children:<Widget>[
                Expanded(
                  flex: 5,
                  child:Padding(
                    padding:EdgeInsets.all(10.0),
                    child:Center(
                      child: Text(
                        quizTools.getQuestion(),
                        textAlign: TextAlign.center,
                        style:TextStyle(
                            color: Colors.white,
                            fontSize: 50
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: answerTrack,
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: RawMaterialButton(
                          fillColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          constraints: BoxConstraints.tightFor(height:38.0,width:300.0),

                          child: Text('正确',
                            style: TextStyle(
                                color: Colors.black,fontSize: 40.0
                            ),

                          ),
                          onPressed: () {

                            checkAnswer(true);
                          }
                      ),
                    )
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: RawMaterialButton(
                      fillColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      constraints: BoxConstraints(minHeight:38,minWidth:300),

                      child: Text('错误',
                        style: TextStyle(
                            color: Colors.black,fontSize: 40.0
                        ),

                      ),
                      onPressed: () {
                        checkAnswer(false);
                      },
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

