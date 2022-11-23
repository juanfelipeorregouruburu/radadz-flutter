import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:radadz_app/src/utils/export.dart';

class CardPaymentHistoryPage extends StatelessWidget {
  const CardPaymentHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listPaymentsHistoryProvider = context.watch<ListPaymentHistoryDriverBloc>();

    return listPaymentsHistoryProvider.isLoading ? ActivityIndicator(marginTop: 50.h)
        : listPaymentsHistoryProvider.listPaymentHistory.payments.length > 0 ?
        ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) => SizedBox(height: 5.h),
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(0.0),
          itemCount: listPaymentsHistoryProvider.listPaymentHistory.payments.length ,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return ItemPaymentHistory(
              index: index,
              payment: listPaymentsHistoryProvider.listPaymentHistory.payments[index]
            );
          },
        ) : EmptyDataView(message: 'payment_card_empty_data'.tr());
  }
}


class ItemPaymentHistory extends StatelessWidget {

  const ItemPaymentHistory({
    Key? key,
    required this.index,
    required this.payment,
  }) : super(key: key);

  final int index;
  final Payment payment;


  @override
  Widget build(BuildContext context) {
    final formatter = new NumberFormat("#,###");

    String textPaymentInfo = 'payment_card_info_payment'.tr() +payment.accountTypeBankPayment.name + ' '+payment.accountNumber+' - '+payment.bankNamePayment.name;

    var money_earned = payment.moneyPayment == "" ? 0 : int.parse(payment.moneyPayment) ;
    var totalMoneyEarned = formatter.format(money_earned);

    var token_earned = payment.tokensCancel == "" ? 0 : int.parse(payment.moneyPayment) ;
    var totalTokenEarned = formatter.format(token_earned);

    return Hero(
      tag: payment.payment_id,
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailTripPaymentPage(trip_payment_id: payment.payment_id)));
        },
        child:Card(
          elevation: 4,
          color: StyleGeneral.GREY,
          shadowColor: StyleGeneral.BLACK,
          margin: EdgeInsets.all(15.r),
          shape:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.white)
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(12.w, 15.h, 12.w, 10.h),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextRowCardWidget(text_row_title: 'payment_card_date_payment'.tr(), text_row_data: payment.paymentDate),
                SizedBox(height: 10.h),
                TextRowCardWidget(text_row_title: 'payment_card_money_payment'.tr(), text_row_data:totalMoneyEarned),
                SizedBox(height: 10.h),
                TextRowCardWidget(text_row_title: 'payment_card_tokens_payment'.tr(), text_row_data: totalTokenEarned),
                SizedBox(height: 10.h),
                Text(textPaymentInfo, overflow: TextOverflow.ellipsis, softWrap: true, maxLines: 2, style: StyleGeneral.styleTextTextCardPaymentDescription
                )
              ]
            )
          )
        )
      )
    );
  }
}
