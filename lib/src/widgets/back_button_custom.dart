import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class BackButtonCustom extends StatelessWidget {

  final String icon;
  const BackButtonCustom({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
              width: ScreenUtil().setWidth(40),
              height: ScreenUtil().setHeight(40),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: StyleGeneral.GREEN,
              ),
              child: Image.asset(icon, height: ScreenUtil().setHeight(50))

          ),
        ),
      ],
    );
  }
}