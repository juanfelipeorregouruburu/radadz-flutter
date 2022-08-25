import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';
import 'package:intl/intl.dart';

class DetailTripHistory extends StatefulWidget {
  final int trip_id;
  const DetailTripHistory({Key key, @required this.trip_id}) : super(key: key);

  @override
  State<DetailTripHistory> createState() => _DetailTripHistoryState();
}

class _DetailTripHistoryState extends State<DetailTripHistory> {

  bool isView = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_){
      Future.microtask(() =>context.read<TripHistoryDetailDriverBloc>().getTripHistoryDetailDriver(trip_id: widget.trip_id.toString()));
      UpdateStateView();
    });

  }

  UpdateStateView(){
    setState(() {
      isView = true;
    });
  }

  @override
  Widget build(BuildContext context) {
     final tripHistoryProvider = context.watch<TripHistoryDetailDriverBloc>();

    return   Hero(
      tag: widget.trip_id,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: BackButtonCustom(icon: "assets/icono_flecha_atras.png")
          ),
          body: tripHistoryProvider.isLoading ? Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: ActivityIndicator(),
          ) : Container(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h , horizontal: 15.w),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),

                       if (isView)
                        DataDetailTripHistory()
                    ]
                  )
                )
              )
            )
          )
        ),
      )
    );
  }


}

class DataDetailTripHistory extends StatelessWidget {
  const DataDetailTripHistory({Key key}) : super(key: key);

  String getSecondsHour(startTime , endTime) {
    DateTime dateTimeFinal = DateTime.parse(startTime);
    DateTime dateFinalNow = DateTime.parse(endTime);
    Duration diff = dateFinalNow.difference(dateTimeFinal);

    var minutes = Duration(seconds: diff.inSeconds).inMinutes;
    var hour = Duration(seconds: diff.inSeconds).inHours;

    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String hourStr = (hour % 60).toString().padLeft(2, '0');
    String segundStr = (diff.inSeconds % 60).toString().padLeft(2, '0');

    return '$hourStr:$minutesStr:$segundStr';
  }

  @override
  Widget build(BuildContext context) {
    final tripHistoryProvider = context.watch<TripHistoryDetailDriverBloc>();
    final detailTrip = tripHistoryProvider.tripDetailHistoryModel.tripDetailHistory;

    var bankName = detailTrip.driver.bank == null ? '' : detailTrip.driver.bank.bankName;
    var data_account = detailTrip.driver.accountType == null ? '' : detailTrip.driver.accountType.name +" - "+detailTrip.driver.accountNumber;
    String timeTotal = getSecondsHour(detailTrip.startTime, detailTrip.endTime);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
            child: Text(
              'payment_card_title_payment_detail'.tr(),
              style: StyleGeneral.styleTextTitle,
              textAlign: TextAlign.left,
            )
        ),
        SizedBox(
          height: 20.h,
        ),

        Align(
            alignment: Alignment.topLeft,
            child: Text(
              'trip_history_card_detail_data_driver'.tr(),
              style: StyleGeneral.styleTextTextCardPaymentSubtitleCard,
              textAlign: TextAlign.left,
            )
        ),


        Card(
          elevation: 4,
          color: StyleGeneral.GREY,
          shadowColor: StyleGeneral.BLACK,
          margin: EdgeInsets.all(5.r),
          shape:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.white)
          ),
          child: Container(
            padding: EdgeInsets.all(10.h),
            child: Column(
              children: [
                TextRowCardWidget(text_row_title: 'trip_history_card_detail_data_driver_name'.tr(), text_row_data: detailTrip.driver.name),
                SizedBox(height: 10.h),
                TextRowCardWidget(text_row_title: 'trip_history_card_detail_data_driver_document'.tr(), text_row_data: detailTrip.driver.documentNumber),
                SizedBox(height: 10.h),
                TextRowCardWidget(text_row_title: 'trip_history_card_detail_data_driver_phone'.tr(), text_row_data: detailTrip.driver.phone),
                SizedBox(height: 10.h),
                TextRowCardWidget(text_row_title: 'trip_history_card_detail_data_driver_address'.tr(), text_row_data: detailTrip.driver.address),
                SizedBox(height: 10.h),
                TextRowCardWidget(text_row_title: 'trip_history_card_detail_data_driver_bank'.tr(), text_row_data: bankName),
                SizedBox(height: 10.h),
                TextRowCardWidget(text_row_title: 'trip_history_card_detail_data_driver_account'.tr(), text_row_data: data_account),
              ]
            )
          )
        ),


        SizedBox(
          height: 20.h,
        ),

        Align(
            alignment: Alignment.topLeft,
            child: Text(
              'trip_history_card_detail_data_Vehicle'.tr(),
              style: StyleGeneral.styleTextTextCardPaymentSubtitleCard,
              textAlign: TextAlign.left,
            )
        ),

        Card(
          elevation: 4,
          color: StyleGeneral.GREY,
          shadowColor: StyleGeneral.BLACK,
          margin: EdgeInsets.all(5.r),
          shape:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.white)
          ),
          child: Container(
            padding: EdgeInsets.all(10.h),
            child: Column(
              children: [
                TextRowCardWidget(text_row_title: 'trip_history_card_detail_data_Vehicle_name'.tr(), text_row_data: detailTrip.driver.vehicleType.name),
                SizedBox(height: 10.h),
                TextRowCardWidget(text_row_title: 'trip_history_card_detail_data_plate_name'.tr(), text_row_data: detailTrip.driver.plateNumber),
                SizedBox(height: 10.h),
                TextRowCardWidget(text_row_title: 'trip_history_card_detail_data_year_name'.tr(), text_row_data: detailTrip.driver.vehicleYear),
              ]
            )
          )
        ),


        SizedBox(
          height: 20.h,
        ),


        Align(
            alignment: Alignment.topLeft,
            child: Text(
              'trip_history_card_detail_data_earning'.tr(),
              style: StyleGeneral.styleTextTextCardPaymentSubtitleCard,
              textAlign: TextAlign.left,
            )
        ),

        Card(
            elevation: 4,
            color: StyleGeneral.GREY,
            shadowColor: StyleGeneral.BLACK,
            margin: EdgeInsets.all(5.r),
            shape:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: Colors.white)
            ),
            child: Container(
                padding: EdgeInsets.all(10.h),
                child: Column(
                    children: [
                      TextRowCardWidget(text_row_title: 'trip_history_card_detail_data_earning_money'.tr(), text_row_data: detailTrip.totalMoneyEarned),
                      SizedBox(height: 10.h),
                      TextRowCardWidget(text_row_title: 'trip_history_card_detail_data_earning_tokens'.tr(), text_row_data: detailTrip.totalTokensEarned),
                    ]
                )
            )
        ),


        SizedBox(
          height: 20.h,
        ),

        Align(
            alignment: Alignment.topLeft,
            child: Text(
              'trip_history_card_detail_data_trip'.tr(),
              style: StyleGeneral.styleTextTextCardPaymentSubtitleCard,
              textAlign: TextAlign.left,
            )
        ),

        SizedBox(
          height: 10.h,
        ),


        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(DateFormat('hh:mm a').format(DateTime.parse(detailTrip.startTime)) , style: StyleGeneral.styleTextTextCardPaymentSubtitleCard) ,
                    Text('trip_history_card_detail_data_trip_start_time'.tr() , style: StyleGeneral.styleTextTextCardPaymentDescription) ,
                  ]
              ),

              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(timeTotal , style: StyleGeneral.styleTextTextCardPaymentSubtitleCard) ,
                    Text('trip_history_card_detail_data_total_time'.tr() , style: StyleGeneral.styleTextTextCardPaymentDescription) ,
                  ]
              ),

              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(DateFormat('hh:mm a').format(DateTime.parse(detailTrip.endTime)) , style: StyleGeneral.styleTextTextCardPaymentSubtitleCard) ,
                    Text('trip_history_card_detail_data_trip_end_time'.tr() , style: StyleGeneral.styleTextTextCardPaymentDescription) ,
                  ]
              )
            ]
        )
      ]
    );
  }
}

