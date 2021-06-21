
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

import 'home.dart';

class Intro extends StatelessWidget {
  List<Slide> slides = new List();

  Intro(){
    slides.add(
      new Slide(
        title: "Get Information",
        styleTitle: TextStyle(color: Colors.black87, fontSize: 26, fontWeight: FontWeight.w700),
        description: "Get news/information on happenings within and outside school",
        styleDescription: TextStyle(color: Colors.black87, fontSize: 22),
        pathImage: "images/1.png",
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        title: "Manage School Payments",
        styleTitle: TextStyle(color: Colors.black87, fontSize: 26,),
        description: "Process payments for Tuition / other related payments",
        styleDescription: TextStyle(color: Colors.black87, fontSize: 22),
        pathImage: "images/2.png",
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        title: "Courses / Results",
        styleTitle: TextStyle(color: Colors.black87, fontSize: 26,),
        description:
        "Register your courses and View your results",
        styleDescription: TextStyle(color: Colors.black87, fontSize: 22),
        pathImage: "images/3.png",
        backgroundColor: Colors.white,
      ),
    );
  }

  void onDonePress() {
    var route = new MaterialPageRoute(builder: (BuildContext context){
      return MyHomePage(title: 'NAU Mobile', loadedSetup: true,);
    });
    Navigator.pushReplacement(route);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new IntroSlider(
        slides: this.slides,
        onDonePress: this.onDonePress,
        onSkipPress: (){
          this.onDonePress();
        },
        colorPrevBtn: Colors.orange,
        colorSkipBtn: Colors.orange,
        colorDoneBtn: Colors.orange,
      ),
    );
  }
}
