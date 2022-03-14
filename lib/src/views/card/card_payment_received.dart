import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:radadz_app/src/utils/export.dart';

class CardPaymentReceivedWidget extends StatefulWidget {
  const CardPaymentReceivedWidget({Key key}) : super(key: key);

  @override
  _CardPaymentReceivedWidgetState createState() => _CardPaymentReceivedWidgetState();
}

class _CardPaymentReceivedWidgetState extends State<CardPaymentReceivedWidget> {
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // context.read<ListPaymentReceivedDriverBloc>().getPaymentReceivedDriver(driver_id: "1", start_time: "2022-01-24", end_date: "2022-03-24");
  }
  
  @override
  Widget build(BuildContext context) {
    final listPaymentRecivedProvider = context.watch<ListPaymentReceivedDriverBloc>();

    return listPaymentRecivedProvider.isLoading
        ? ActivityIndicator(marginTop: 50.h)
        : ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) => SizedBox(height: 15.h),
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(0.0),
            itemCount: listPaymentRecivedProvider?.paymentReceivedList.payments.length ?? 0,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return ItemPaymentRecived(
                index: index,
                payment: listPaymentRecivedProvider?.paymentReceivedList?.payments[index],
                paymentsList: listPaymentRecivedProvider?.paymentReceivedList?.payments,
              );
            },
        );
  }
}

class ItemPaymentRecived extends StatelessWidget {

  const ItemPaymentRecived({
    Key key,
    @required this.index,
    @required this.payment,
    @required this.paymentsList,
  }) : super(key: key);

  final int index;
  final Payment payment;
  final List<Payment> paymentsList;

  @override
  Widget build(BuildContext context) {
    final paymentProvider = context.watch<ListPaymentReceivedDriverBloc>();
    final formatter = new NumberFormat("#,###");

    return GestureDetector(
      onTap: (){
        paymentProvider.selectOrderDetail(payment);
        Navigator.pushNamed(context, 'detailPaymentReceived');
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

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                     'payment_card_total_trip'.tr() + payment.trips.length.toString(),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 1,
                      style: TextStyle(
                        color: StyleGeneral.BLACK,
                        fontSize: ScreenUtil().setSp(15),
                        fontFamily: 'Poppins-Bold',
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child:  Align(
                       alignment: Alignment.centerRight,
                       child: Container(
                         width: 85.h,
                         height: 30.w,
                         alignment: Alignment.center,
                         padding: const EdgeInsets.all(5),
                         decoration: BoxDecoration(
                           color: StyleGeneral.GREEN,
                           borderRadius: BorderRadius.circular(30),
                         ),
                         child: Text(
                           'payment_card_buton_detail'.tr(),
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: ScreenUtil().setSp(10),
                             fontFamily: 'Poppins-Semi',
                           ),
                         ),
                       ),
                     ),
                  )

                ],
              ),

              SizedBox(height: 20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      'payment_card_date_payment'.tr(),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 1,
                      style: TextStyle(
                        color: StyleGeneral.BLACK,
                        fontSize: ScreenUtil().setSp(15),
                        fontFamily: 'Poppins-Bold',
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      payment.paymentDate,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 1,
                      style: TextStyle(
                        color: StyleGeneral.BLACK,
                        fontSize: ScreenUtil().setSp(14),
                        fontFamily: 'Poppins-Semi',
                      ),
                    ),
                  ),


                ],
              ),


              SizedBox(height: 10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      'payment_card_money_payment'.tr(),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 2,
                      style: TextStyle(
                        color: StyleGeneral.BLACK,
                        fontSize: ScreenUtil().setSp(15),
                        fontFamily: 'Poppins-Bold',
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      '\$' + formatter.format(int.parse(payment.moneyPayment)),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 1,
                      style: TextStyle(
                        color: StyleGeneral.BLACK,
                        fontSize: ScreenUtil().setSp(14),
                        fontFamily: 'Poppins-Semi',
                      ),
                    ),
                  ),


                ],
              ),

              SizedBox(height: 10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      'payment_card_tokens_payment'.tr(),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 2,
                      style: TextStyle(
                        color: StyleGeneral.BLACK,
                        fontSize: ScreenUtil().setSp(15),
                        fontFamily: 'Poppins-Bold',
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      formatter.format(int.parse(payment.tokensCancel)),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 1,
                      style: TextStyle(
                        color: StyleGeneral.BLACK,
                        fontSize: ScreenUtil().setSp(14),
                        fontFamily: 'Poppins-Semi',
                      ),
                    ),
                  ),


                ],
              ),
            ],
          ),
        ),
      )
    );
  }
  
}
