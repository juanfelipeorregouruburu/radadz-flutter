import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:radadz_app/src/utils/export.dart';

class InWellCustom extends StatelessWidget {

  final String text;
  final Function onTap;
  final Color color;

  const InWellCustom({
    @required this.text,
    this.onTap,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 1,
              style: TextStyle(
                color: StyleGeneral.GREY_LIGTH,
                fontSize: ScreenUtil().setSp(15),
                fontFamily: 'Poppins-Regular',
              ),
            ),
          ),

          Flexible(
            flex: 0,
            fit: FlexFit.loose,
            child: Container(
              width: 25.h,
              height: 25.h,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: StyleGeneral.GREEN,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                  size: ScreenUtil().setSp(15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
