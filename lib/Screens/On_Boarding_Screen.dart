import 'package:challenge_30_seconds/Data/static.dart';
import 'package:challenge_30_seconds/Data/staticColors.dart';
import 'package:challenge_30_seconds/Wedgit/Button.dart';
import 'package:flutter/material.dart';
import 'package:challenge_30_seconds/Screens/Login_Screen.dart';
import 'package:outlined_text/models/outlined_text_stroke.dart';
import 'package:outlined_text/outlined_text.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

late int dotWidth;
int cIndex = 0;

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    var h=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: w,
        height: h,
        decoration:  BoxDecoration(
          gradient: LinearGradient(colors: [
            StaticColors.deepPink,
            Color(0xffffffff)
          ],
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
            stops: [0.2,1]
          )
        ),
        child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                 ///App Name Text
                 OutlinedText(
                  text: const Text("30-Seconds",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                    fontFamily: 'JotiOne',
                  ),
                ),
                  strokes: [
                    OutlinedTextStroke(color: Colors.black,width: 10),
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (value) {
                      setState(() {
                        cIndex = value;
                      });
                    },
                    itemCount: onBoardingList.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        const SizedBox(height: 10,),
                    OutlinedText(
                    text: Text(onBoardingList[index].body!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontFamily: 'JotiOne',
                      ),
                    textAlign: TextAlign.center,
                    ),
                    strokes: [
                      OutlinedTextStroke(color: Colors.black,width: 5),
                    ],
                    ),
                        const SizedBox(
                          height: 60,
                        ),
                        Image.asset(
                          onBoardingList[index].image!,
                          width: 300,
                          height: 320,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                              onBoardingList.length, (index) => dotBuilder(index))
                        ],
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 35,),
                        child: customButton(
                          buttonText: cIndex < onBoardingList.length - 1
                              ? "Continue"
                              : "Next",
                          onTap: () {
                            if (cIndex == onBoardingList.length - 1) {

                            }
                            _controller!.nextPage(
                                duration: const Duration(microseconds: 100),
                                curve: Curves.bounceIn);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  AnimatedContainer dotBuilder(int index) {
    return AnimatedContainer(
      curve: Curves.easeIn,
      margin: const EdgeInsets.only(right: 5),
      duration: const Duration(microseconds: 900),
      width: index == cIndex ? 25 : 10,
      height: 10,
      decoration: BoxDecoration(
          color: cIndex == index
              ? StaticColors.Pink
              : const Color(0xffffffff),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
