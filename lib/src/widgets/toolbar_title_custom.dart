import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class ToolbarTitleCustom extends StatelessWidget {
  final String title;
  const ToolbarTitleCustom({required this.title , Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Text(title, style: StyleGeneral.styleTextTitle , textAlign: TextAlign.center,)
    );
  }
}



