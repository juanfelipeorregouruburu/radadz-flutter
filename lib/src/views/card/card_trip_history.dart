import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class CardTripHistoryWidget extends StatelessWidget {
  const CardTripHistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final listTripHistoryProvider = context.watch<ListTripHistoryDriverBloc>();

    return listTripHistoryProvider.isLoading ? ActivityIndicator(marginTop: 50.h) :
    listTripHistoryProvider.listTripsHistory.trips.length > 0 ?
    ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 5.h),
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(0.0),
        itemCount: listTripHistoryProvider.listTripsHistory.trips.length ,
        itemBuilder: (BuildContext context, int index) {
          return ItemTripHistory(
              index: index,
              trip: listTripHistoryProvider.listTripsHistory.trips[index]
          );
        }
    ) :EmptyDataView(message: 'payment_card_empty_data'.tr());
  }
}


class ItemTripHistory extends StatelessWidget {
  final int index;
  final TripHistory trip;

  const ItemTripHistory({
    Key? key,
    required this.index,
    required this.trip
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = new NumberFormat("#,###");

    var money_earned = trip.totalMoneyEarned == "" ? 0 : int.parse(trip.totalMoneyEarned) ;
    var totalMoneyEarned = formatter.format(money_earned);

    return Hero(
        tag: trip.id,
        child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailTripHistory(trip_id: trip.id)));
            },
            child: Card(
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
                          TextRowCardWidget(text_row_title: 'trip_history_card_start_time'.tr(), text_row_data:  DateFormat('y-MM-dd h:mm a').format(DateTime.parse(trip.startTime))),
                          SizedBox(height: 10.h),
                          TextRowCardWidget(text_row_title: 'trip_history_card_end_time'.tr(), text_row_data:  DateFormat('y-MM-dd h:mm a').format(DateTime.parse(trip.endTime))),
                          SizedBox(height: 10.h),
                          TextRowCardWidget(text_row_title: 'trip_history_card_total_tokens_earned'.tr(), text_row_data:  trip.totalTokensEarned == "" ? "0" : trip.totalTokensEarned),
                          SizedBox(height: 10.h),
                          TextRowCardWidget(text_row_title: 'trip_history_card_total_money_earned'.tr(), text_row_data:  totalMoneyEarned),
                        ]
                    )
                )
            )
        )
    );
  }

}
