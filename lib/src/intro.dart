import 'dart:io';

import 'package:flutter/material.dart';
import 'package:radadz_app/src/models/slider_model.dart';
import 'package:radadz_app/src/utils/export.dart';

class Intro extends StatefulWidget {
  const Intro({Key key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {

  List<SliderModel> sliders = new List<SliderModel>();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);
  final prefs = new Preferences();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    statusBarLight();
    sliders = getSlides();
  }



  @override
  Widget build(BuildContext context) {
    Widget pageIndexIndicator(bool isCurrentPage) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 2.0),
        height: isCurrentPage ? 10.h : 6.h,
        width: isCurrentPage ? 10.w : 6.w,
        decoration: BoxDecoration(
            color: isCurrentPage ? StyleGeneral.GREEN : Colors.grey[300],
            borderRadius: BorderRadius.circular(12.r)),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: PageView.builder(
            controller: pageController,
            onPageChanged: (val) {
              setState(() {
                currentIndex = val;
              });
            },
            itemCount: sliders.length,
            itemBuilder: (context, index) {
              return SliderTitle(
                imageAssetPath: sliders[index].getImagePath(),
                title: sliders[index].getTitle(),
                descripcion: sliders[index].getDescription(),
              );
            }),
        bottomSheet: currentIndex != sliders.length - 1
            ? Container(
          height: Platform.isIOS ? 100.w : 90.w,
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(35.w, 0, 35.w, 35.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  pageController.animateToPage(sliders.length - 1,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.linear);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 100.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: StyleGeneral.GREY,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'intro_button_skip'.tr(),
                      style: TextStyle(
                          color: StyleGeneral.BLACK,
                          fontSize: ScreenUtil().setSp(15),
                          fontFamily: 'Poppins-Semi'),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i = 0; i < sliders.length; i++)
                    currentIndex == i
                        ? pageIndexIndicator(true)
                        : pageIndexIndicator(false)
                ],
              ),
              GestureDetector(
                  onTap: () {
                    pageController.animateToPage(currentIndex + 1,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.linear);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 100.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: StyleGeneral.GREEN,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'intro_button_next'.tr(),
                        style: TextStyle(
                            color: StyleGeneral.WHITE,
                            fontSize: ScreenUtil().setSp(15),
                            fontFamily: 'Poppins-Semi'),
                      ),
                    ),
                  )),
            ],
          ),
        )
            : GestureDetector(
          onTap: () {
            prefs.setIntro = true ;
            Navigator.of(context).pushNamed('register');
          },
          child: Container(
            alignment: Alignment.center,
            color: Colors.white,
            height: Platform.isIOS ? 100.w : 90.w,
            padding: EdgeInsets.fromLTRB(35.w, 0, 35.w, 35.h),
            child: Container(
              alignment: Alignment.center,
              width: 190.w,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: StyleGeneral.GREEN,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  'intro_button_start'.tr(),
                  style: TextStyle(
                      color: StyleGeneral.WHITE,
                      fontSize: ScreenUtil().setSp(15),
                      fontFamily: 'Poppins-Semi'),
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }


}


class SliderTitle extends StatelessWidget {
  String imageAssetPath, title, descripcion;
  SliderTitle({this.imageAssetPath, this.title, this.descripcion});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50.h,
          ),
          Image.asset(imageAssetPath , width: 300.h ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: StyleGeneral.BLACK, fontSize: ScreenUtil().setSp(20), fontFamily: 'Poppins-Bold')
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Text(
              descripcion,
              textAlign: TextAlign.center,
              style: TextStyle(color: StyleGeneral.GREY_LIGTH, fontSize: ScreenUtil().setSp(15), fontFamily: 'Poppins-Medium'),
            ),
          )
        ],
      ),
    );
  }
}