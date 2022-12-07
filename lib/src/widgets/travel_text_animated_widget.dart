import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class TextAnimatedLiveWidget extends StatelessWidget {
  const TextAnimatedLiveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 135.w,
        height: 35.h,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                    width: 16,
                    height: 16,
                  ),
                  SizedBox(width: 5.w),
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      FadeAnimatedText('trip_state_button_animated'.tr(), textStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800, letterSpacing: 1, color: Colors.redAccent) , duration: const Duration(seconds: 2),fadeOutBegin: 0.8,fadeInEnd: 0.6),
                    ],
                  ),
                ]
            )
        )
    );
  }
}