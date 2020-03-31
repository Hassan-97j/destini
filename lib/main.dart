import 'package:flutter/material.dart';
//import 'story.dart';
import 'storyWork.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}


class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {


// created mystory object from StoryWork class
StoryWork mystory = StoryWork();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/background.png'),fit: BoxFit.cover) ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    mystory.getStory(),//using mystory object to get our first story in this widget
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    //Choice 1 made by user.
                  setState(() {
                    mystory.nextStory(1); //using mystory object to get next story method and pass 1 as user choice
                  });  
                  },
                  color: Colors.red,
                  child: Text(
                    //'Choice 1',
                    mystory.getChoice1(),//getting the text of choice 1
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility( //a flutter visibility widget is used 
                  visible: mystory.buttonShouldBeVisible(), //get ot from the buttonshouldbevisible() property
                                  child: FlatButton(
                    onPressed: () {
                      //Choice 2 made by user.
                     setState(() {
                       mystory.nextStory(2); //using mystory object to get next story method and pass 1 as user choice
                     }); 
                    },
                    color: Colors.blue,
                    child: Text(
                      //'Choice 2',
                      mystory.getChoice2(), // getting text of choice 2
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
