import 'package:flutter/material.dart';
import 'package:radadz_app/src/models/payment_detail_model.dart';
import 'package:radadz_app/src/utils/export.dart';
import 'package:radadz_app/src/utils/get_second.dart';

class PaymentDetailPage extends StatelessWidget {
  final int paymentId ;
  const PaymentDetailPage({Key? key, required this.paymentId}) : super(key: key);
  //const PaymentDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = Repository();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(),
        automaticallyImplyLeading: false,
        flexibleSpace : ToolbarTitleCustom(title: 'payment_Detail_title'.tr())
      ),
        body: Hero(
          tag: paymentId.toString(),
          child: FutureBuilder<PaymentDetailModel>(
            future: repository.getPaymentDetailRepository(paymentId.toString()),
            builder: (context, snapshot){

              if(snapshot.hasData){
                var driver = snapshot.data!.driver;
                var trips = snapshot.data!.data;
                var tripPayment = snapshot.data!.tripPayment;

                return Padding(
                  padding: EdgeInsets.all(16.r),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          height: 1.h,
                          width: double.infinity,
                          color: Colors.black54
                        ),
                        SizedBox(height: 15.h),
                        TextRowCardWidget(text_row_title: 'data_payment_subtitle_driver'.tr(), text_row_data: "${driver.firstName} ${driver.secondName} ${driver.firstLastname}"),
                        SizedBox(height: 15.h),
                        TextRowCardWidget(text_row_title: 'data_payment_subtitle_document_type'.tr(), text_row_data: "${formatString(driver.documentType.docuementType)}"),
                        SizedBox(height: 15.h),
                        TextRowCardWidget(text_row_title: 'data_payment_subtitle_document_number'.tr(), text_row_data: driver.documentNumber),
                        SizedBox(height: 15.h),
                        TextRowCardWidget(text_row_title: 'data_payment_subtitle_bank'.tr(), text_row_data: "${driver.bankName.bankType}"),
                        SizedBox(height: 15.h),
                        TextRowCardWidget(text_row_title: 'data_payment_subtitle_bank_type'.tr(), text_row_data: "${formatString(driver.accountType.accountType)}"),
                        SizedBox(height: 15.h),
                        TextRowCardWidget(text_row_title: 'data_payment_subtitle_account_number'.tr(), text_row_data: driver.accounNumber),
                        SizedBox(height: 15.h),
                        TextRowCardWidget(text_row_title: 'data_payment_subtitle_total_trips'.tr(), text_row_data: "0"),
                        SizedBox(height: 15.h),
                        TextRowCardWidget(text_row_title: 'data_payment_subtitle_trip_first_date'.tr(), text_row_data: DateFormat('dd/MM/y hh:mm a').format(DateTime.parse(trips.first.startTime))),
                        SizedBox(height: 15.h),
                        TextRowCardWidget(text_row_title: 'data_payment_subtitle_trip_last_date'.tr(), text_row_data:  DateFormat('dd/MM/y hh:mm a').format(DateTime.parse(trips.last.startTime))),
                        SizedBox(height: 15.h),
                        Container(height: 1.h, width: double.infinity, color: Colors.black54),
                        SizedBox(height: 15.h),
                        TextRowCardWidget(text_row_title: 'data_payment_subtitle_finished_video_hours'.tr(), text_row_data: "${tripPayment.totalTimeVideoFinished}"),
                        SizedBox(height: 15.h),
                        TextRowCardWidget(text_row_title: 'data_payment_subtitle_interrupted_video_hours'.tr(), text_row_data: "${tripPayment.totalTimeVideoInterrupted}"),
                        SizedBox(height: 15.h),
                        TextRowCardWidget(text_row_title: 'data_payment_subtitle_static_image_hours'.tr(), text_row_data:  "${tripPayment.totalTimeImageFinished}"),
                        SizedBox(height: 15.h),
                        TextRowCardWidget(text_row_title: 'data_payment_subtitle_tokens_earned_finished'.tr(), text_row_data: "${tripPayment.totalTokensVideoFinished}"),
                        SizedBox(height: 15.h),
                        TextRowCardWidget(text_row_title: 'data_payment_subtitle_tokens_earned_interrupted'.tr(), text_row_data: "${tripPayment.totalTokensVideoInterrupted}"),
                        SizedBox(height: 15.h),
                        TextRowCardWidget(text_row_title: 'data_payment_subtitle_tokens_earned_static_image'.tr(), text_row_data: "${tripPayment.totalTokensImageFinished}"),
                        SizedBox(height: 15.h),
                        TextRowCardWidget(text_row_title: 'data_payment_subtitle_money_earned_finished'.tr(), text_row_data: "${tripPayment.totalMoneyVideoFinished}"),
                        SizedBox(height: 15.h),
                        TextRowCardWidget(text_row_title: 'data_payment_subtitle_money_earned_interrupted'.tr(), text_row_data: "${tripPayment.totalMoneyVideoInterrupted}"),
                        SizedBox(height: 15.h),
                        TextRowCardWidget(text_row_title: 'data_payment_subtitle_money_earned_static_image'.tr(), text_row_data: "${tripPayment.totalMoneyImageFinished}"),
                        SizedBox(height: 15.h),
                        TextRowCardWidget(text_row_title: 'data_payment_subtitle_net_tokens_spent'.tr(), text_row_data: "${tripPayment.totalTimeVideoInterrupted}"),
                        SizedBox(height: 15.h),
                        TextRowCardWidget(text_row_title: 'data_payment_subtitle_net_tokens_earned'.tr(), text_row_data: "${tripPayment.totalTokensCanceled}"),
                        SizedBox(height: 15.h),
                        TextRowCardWidget(text_row_title: 'data_payment_subtitle_net_money_earned'.tr(), text_row_data:  "${tripPayment.totalMoneyPayed}"),
                        SizedBox(height: 15.h),
                        Container(height: 1.h, width: double.infinity, color: Colors.black54),
                        SizedBox(height: 10.h),
                        HeaderTableWidget(),
                        ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (BuildContext context, int index) => Container(height: 1.h, width: double.infinity, color: Colors.black54),
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.all(0.0),
                          itemCount: trips.length ,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return BodyTableWidget(data: trips[index]);
                          }
                        ),
                        Container(height: 1.h, width: double.infinity, color: Colors.black54)
                      ]
                    )
                  )
                );

              }

              return ActivityIndicator(marginTop: 50.h);
            }
          ),
        )
    );
  }
}


class BodyTableWidget extends StatelessWidget {
  final Datum data;
  const BodyTableWidget({Key? key , required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 35.h,
      color: Colors.white,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 1 , child: Container(color: Colors.black)),
          Expanded(
            child: Text( DateFormat('dd/MM/yy - hh:mm').format(DateTime.parse(data.startTime)) , textAlign: TextAlign.center, style: TextStyle(color: StyleGeneral.BLACK, fontSize: ScreenUtil().setSp(10), fontFamily: 'Poppins-Semi'))
          ),
          SizedBox(width: 1 , child: Container(color: Colors.black)),
          Expanded(
            child: Text( DateFormat('dd/MM/yy - hh:mm').format(DateTime.parse(data.endDate)), textAlign: TextAlign.center, style: TextStyle(color: StyleGeneral.BLACK, fontSize: ScreenUtil().setSp(10), fontFamily: 'Poppins-Semi'))
          ),
          SizedBox(width: 1 , child: Container(color: Colors.black)),
          Expanded(
            child: Text(durationTime(data.endDate, data.startTime), textAlign: TextAlign.center, style: TextStyle(color: StyleGeneral.BLACK, fontSize: ScreenUtil().setSp(12), fontFamily: 'Poppins-Semi'))
          ),
          SizedBox(width: 1 , child: Container(color: Colors.black)),
        ]
      )
    );
  }
}



class HeaderTableWidget extends StatelessWidget {
  const HeaderTableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      color: Colors.black,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text('data_payment_subtitle_trip_start_time'.tr().toUpperCase() , textAlign: TextAlign.center, style: TextStyle(color: StyleGeneral.WHITE, fontSize: ScreenUtil().setSp(13), fontFamily: 'Poppins-Semi'))
          ),
          SizedBox(width: 1 , child: Container(color: Colors.white)),
          Expanded(
            child: Text('data_payment_subtitle_trip_end_date'.tr().toUpperCase(), textAlign: TextAlign.center, style: TextStyle(color: StyleGeneral.WHITE, fontSize: ScreenUtil().setSp(13), fontFamily: 'Poppins-Semi'))
          ),
          SizedBox(width: 1 , child: Container(color: Colors.white)),
          Expanded(
            child: Text('data_payment_table_header_trip_duration'.tr().toUpperCase() , textAlign: TextAlign.center, style: TextStyle(color: StyleGeneral.WHITE, fontSize: ScreenUtil().setSp(11), fontFamily: 'Poppins-Semi'))
          )
        ]
      )
    );
  }
}
