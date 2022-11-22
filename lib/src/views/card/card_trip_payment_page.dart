import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';
import 'package:intl/intl.dart';

class CardTripPaymentWidget extends StatelessWidget {
  const CardTripPaymentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listTripPaymentProvider = context.watch<ListTripPaymentDriverBloc>();

    return listTripPaymentProvider.isLoading ? ActivityIndicator(marginTop: 50.h) :
      Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 135.h,
                    height: 35.w,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: StyleGeneral.GREEN,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'payment_card_total_trip'.tr() + listTripPaymentProvider.listTripPaymentsHistory.payments.length.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(15),
                        fontFamily: 'Poppins-Semi',
                      )
                    )
                  )
                )
              )
            ]
          ),
          SizedBox(height: 10.h),
          ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) => SizedBox(height: 5.h),
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(0.0),
            itemCount: listTripPaymentProvider.listTripPaymentsHistory.payments.length ?? 0,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return ItemTripPayment(
                  index: index,
                  trip: listTripPaymentProvider.listTripPaymentsHistory.payments[index]
              );
            }
          )
        ]
      );
  }
}

class ItemTripPayment extends StatelessWidget{

  const ItemTripPayment({
    Key? key,
    required this.index,
    required this.trip
  }) : super(key: key);

  final int index;
  final Trip trip;

  @override
  Widget build(BuildContext context) {
    final formatter = new NumberFormat("#,###");

    var money_earned = trip.moneyEarned == "" ? 0 : int.parse(trip.moneyEarned) ;
    var totalMoneyEarned = formatter.format(money_earned);

    var token_earned = trip.tokenEarned == "" ? 0 : int.parse(trip.tokenEarned) ;
    var totalTokenEarned = formatter.format(token_earned);

   return Card(
     elevation: 4,
     color: StyleGeneral.GREY,
     shadowColor: StyleGeneral.BLACK,
     margin: EdgeInsets.all(15.r),
     shape:  OutlineInputBorder(
         borderRadius: BorderRadius.circular(10.r),
         borderSide: BorderSide(color: Colors.white)
     ),
     child: Container(
       padding: EdgeInsets.fromLTRB(10.w, 15.h, 10.w, 10.h),
       child: Padding(
         padding: EdgeInsets.only(top: 15.h, right: 10.w, left: 10.w, bottom: 15.h),
         child: Column(
           mainAxisSize: MainAxisSize.min,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             TextRowCardWidget(text_row_title: 'payment_card_start_time_payment_detail'.tr(), text_row_data: trip.endTime == "" ? "" : DateFormat('y-MM-dd  h:mm a').format(DateTime.parse(trip.endTime))),
             SizedBox(height: 10.h),
             TextRowCardWidget(text_row_title: 'payment_card_end_time_payment_detail'.tr(), text_row_data: trip.endTime == "" ? "" : trip.endTime == "" ? "" : DateFormat('y-MM-dd  h:mm a').format(DateTime.parse(trip.endTime))),
             SizedBox(height: 10.h),
             TextRowCardWidget(text_row_title: 'payment_card_money_payment_detail'.tr(), text_row_data: totalMoneyEarned),
             SizedBox(height: 10.h),
             TextRowCardWidget(text_row_title: 'payment_card_token_payment_detail'.tr(), text_row_data: totalTokenEarned),
           ]
         )
       )
     )
   );
  }
}
