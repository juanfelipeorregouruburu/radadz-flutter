import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class TextRowCardWidget extends StatelessWidget {
  final String text_row_title;
  final String text_row_data;
  const TextRowCardWidget({Key? key, required this.text_row_title, required this.text_row_data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
                text_row_title,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 2,
                style: StyleGeneral.styleTextTextCardPaymentTitle
            ),
          ),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(
                  text_row_data,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 2,
                  style: StyleGeneral.styleTextTextCardPaymentDescription
              )
          )
        ]
    );
  }
}
