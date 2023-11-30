import 'package:flutter/material.dart';
import 'package:radadz_app/src/models/payment_model.dart';
import 'package:radadz_app/src/utils/export.dart';
import 'package:radadz_app/src/views/payment/payment_detail_page.dart';

class PaymentCardWidget extends StatelessWidget {
  final Datum datum ;
  const PaymentCardWidget({Key? key , required this.datum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: datum.id.toString(),
      child: Card(
        elevation: 4,
        color: StyleGeneral.GREY,
        shadowColor: StyleGeneral.BLACK,
        margin: EdgeInsets.all(10.r),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: StyleGeneral.BLACK_LIGTH_25)
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(15.w, 15.h, 5.w, 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextRowCardWidget(text_row_title: 'data_payment_subtitle_date'.tr(), text_row_data: DateFormat('dd/MM/y hh:mm a').format(DateTime.parse(datum.paymentTime))),
              SizedBox(height: 10.h),
              TextRowCardWidget(text_row_title: 'data_payment_subtitle_money_earned_finished'.tr(), text_row_data: "${datum.totalTokensCanceled}"),
              SizedBox(height: 10.h),
              TextRowCardWidget(text_row_title: 'data_payment_subtitle_money_earned_finished'.tr(), text_row_data: "${datum.totalMoneyPayed}"),
              SizedBox(height: 10.h),
              TextRowCardWidget(text_row_title: 'data_payment_subtitle_account_number'.tr(), text_row_data: "${datum.accountNumber}"),
              SizedBox(height: 10.h),
              TextRowCardWidget(text_row_title: 'data_payment_subtitle_bank_type'.tr(), text_row_data: "${formatString(datum.accountType.accountType)}"),
              SizedBox(height: 10.h),
              TextRowCardWidget(text_row_title: 'data_payment_subtitle_bank'.tr(), text_row_data: "${formatString(datum.bankName.bankType)}"),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> PaymentDetailPage(paymentId: datum.id)));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      width: 130.w,
                      height: 35.h,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.w), color: StyleGeneral.GREEN),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Text("payment_Detail_title".tr(), textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(13), fontFamily: 'Poppins-Semi'))
                      )
                    )
                  )
                )
              )
            ]
          )
        )
      ),
    );
  }
}
