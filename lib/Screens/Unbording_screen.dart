import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../Constants/AppColors.dart';
import 'Login.dart';
import 'UnbordingContent.dart';
class Unbording_screen extends StatefulWidget {
  const Unbording_screen({super.key});

  @override
  State<Unbording_screen> createState() => _Unbording_screenState();
}

class _Unbording_screenState extends State<Unbording_screen> {

  // int currentIndex = 0;
  // late PageController _controller;
  //
  // @override
  // void initState() {
  //   _controller = PageController(initialPage: 0);
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }
  //
  // TextStyle basicText = TextStyle(
  //     fontSize: 17.0,
  //     fontWeight: FontWeight.w600,
  //     color: AppColors.blackColor);
  //
  // TextStyle smallText = TextStyle(
  //     fontSize: 14.0,
  //     fontWeight: FontWeight.w500,
  //     color: AppColors.blackColor);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Real-time Valuation',
              body: 'As you answer quick questions, see your business value update instantly with interactive graphs and benchmarks.',
              image: buildImage("assets/onbording.png"),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Compare Your KPIs',
              body: 'Track your performance against sector benchmarks and gain insights on where your business stands.',
              image: buildImage("assets/onbording.png"),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Grow Your Business',
              body: 'Unlock detailed reports and expert recommendations to take your business to the next level.',
              image: buildImage("assets/onbording.png"),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
          ],
          onDone: () {
            if (kDebugMode) {
              print("Done clicked");
              Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
            }
          },
          //ClampingScrollPhysics prevent the scroll offset from exceeding the bounds of the content.
          scrollPhysics: const ClampingScrollPhysics(),
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: true,
        //  isBottomSafeArea: true,
          globalBackgroundColor: Colors.white,
          skip:
          const Text("Skip", style: TextStyle(fontWeight: FontWeight.w600)),
          next: Text("Next", style: TextStyle(fontWeight: FontWeight.w600)),
          done:
          const Text("Start", style: TextStyle(fontWeight: FontWeight.w600)),
          dotsDecorator: getDotsDecorator()),
      backgroundColor: Colors.white,
    );
  }

  //widget to add the image on screen
  Widget buildImage(String imagePath) {
    return Center(
        child: Image.asset(
          imagePath,
          width: 450,
          height: 200,
        ));
  }

  //method to customise the page style
  PageDecoration getPageDecoration() {
    return const PageDecoration(
      imagePadding: EdgeInsets.only(top: 120),
      pageColor: Colors.white,
      bodyPadding: EdgeInsets.only(top: 8, left: 20, right: 20),
      titlePadding: EdgeInsets.only(top: 50),
      bodyTextStyle: TextStyle(color: Colors.black54, fontSize: 15),
    );
  }

  //method to customize the dots style
  DotsDecorator getDotsDecorator() {
    return const DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: 2),
      activeColor: Colors.indigo,
      color: Colors.grey,
      activeSize: Size(12, 5),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}