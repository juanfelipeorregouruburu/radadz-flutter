import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';
import 'package:intl/intl.dart';


class DetailPaymentReceived extends StatelessWidget {
  final formatter = new NumberFormat("#,###");
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final paymentProvider = context.watch<ListPaymentReceivedDriverBloc>();
    final detailPayment = paymentProvider.selectPayment;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: BackButtonCustom(icon: "assets/icono_flecha_atras.png")
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(5.w),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Center(
                    child: Text(
                      'payment_card_title_payment_detail'.tr(),
                      style: StyleGeneral.styleTextTitle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) => SizedBox(height: 15.h),
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(0.0),
                    itemCount: detailPayment.trips.length?? 0,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemDetailPaymentRecived(
                        index: index,
                        trip: detailPayment?.trips[index],
                        tripsList: detailPayment?.trips,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}

class ItemDetailPaymentRecived extends StatelessWidget{

  const ItemDetailPaymentRecived({
    Key key,
    @required this.index,
    @required this.trip,
    @required this.tripsList,
  }) : super(key: key);

  final int index;
  final Trip trip;
  final List<Trip> tripsList;

  @override
  Widget build(BuildContext context) {

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
       padding: EdgeInsets.fromLTRB(12.w, 15.h, 12.w, 10.h),
       child: Padding(
         padding: EdgeInsets.only(top: 15.h, right: 10.w, left: 15.w, bottom: 15.h),
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
                     'payment_card_starttime_payment_detail'.tr(),
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
                     DateFormat('y-MM-dd  h:mm a').format(DateTime.parse(trip.startTime)),
                     overflow: TextOverflow.ellipsis,
                     softWrap: true,
                     maxLines: 1,
                     style: StyleGeneral.styleTextTextCardPaymentDescription
                   ),
                 ),

               ],
             ),

             SizedBox(height: 15.h),
             Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Flexible(
                   flex: 1,
                   fit: FlexFit.tight,
                   child: Text(
                     'payment_card_endtime_payment_detail'.tr(),
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
                     DateFormat('y-MM-dd  h:mm a').format(DateTime.parse(trip.endTime)),
                     overflow: TextOverflow.ellipsis,
                     softWrap: true,
                     maxLines: 2,
                     style: StyleGeneral.styleTextTextCardPaymentDescription
                   ),
                 ),

               ],
             ),

             SizedBox(height: 15.h),
             Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Flexible(
                   flex: 1,
                   fit: FlexFit.tight,
                   child: Text(
                     'payment_card_token_payment_detail'.tr(),
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
                     trip.tokenEarned,
                     overflow: TextOverflow.ellipsis,
                     softWrap: true,
                     maxLines: 1,
                     style: StyleGeneral.styleTextTextCardPaymentDescription
                   ),
                 ),

               ],
             ),

             SizedBox(height: 15.h),
             Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Flexible(
                   flex: 1,
                   fit: FlexFit.tight,
                   child: Text(
                     'payment_card_money_payment_detail'.tr(),
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
                     trip.moneyEarned,
                     overflow: TextOverflow.ellipsis,
                     softWrap: true,
                     maxLines: 1,
                     style: StyleGeneral.styleTextTextCardPaymentDescription
                   ),
                 ),

               ],
             ),

           ],
         ),
       ),
     ),
   );
  }
}
