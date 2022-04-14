import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:radadz_app/src/utils/export.dart';

class MenuItem extends StatelessWidget {

  final AssetImage icon;
  final String title;
  final double padding;
  final Function onTap;

  const MenuItem({Key key, @required this.icon,  @required  this.title, this.onTap, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Container(
          width: double.infinity,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Image(
                    image: this.icon
                ),
              ),
              Expanded(
                flex: 8,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(
                      title,
                      textAlign: TextAlign.left,
                      style: StyleGeneral.styleTextTitleMenu,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 1,
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