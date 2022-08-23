import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class CardTripHistoryWidget extends StatelessWidget {
  const CardTripHistoryWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final listTripHistoryProvider = context.watch<ListTripHistoryDriverBloc>();

    return listTripHistoryProvider.isLoading ? ActivityIndicator(marginTop: 50.h) :
    listTripHistoryProvider.tripHistoryList.trips.length > 0 ?
    ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 5.h),
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(0.0),
        itemCount: listTripHistoryProvider.tripHistoryList.trips.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return ItemTripHistory(
              index: index,
              trip: listTripHistoryProvider.tripHistoryList.trips[index]
          );
        }

    )
        :EmptyDataView(message: 'payment_card_empty_data'.tr());
  }
}


class ItemTripHistory extends StatelessWidget {
  final int index;
  final TripHistory trip;

  const ItemTripHistory({
    Key key,
    @required this.index,
    @required this.trip
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tripProvider = context.watch<ListTripHistoryDriverBloc>();

    String name = trip.driver.firstName +" "+  trip.driver.secondName+" "+ trip.driver.firstLastName +" "+trip.driver.secondLastName;

    return Hero(
        tag: trip.id,
        child: GestureDetector(
            onTap: (){
              tripProvider.selectTripDetail(trip);
              Navigator.pushNamed(context, 'detail_trip_history');
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
                          //
                          TextRow('trip_history_card_driver_name'.tr(), name),
                          SizedBox(height: 10.h) ,
                          TextRow('trip_history_card_driver_vehicle'.tr(), trip.driver.vehicleType.name),
                          SizedBox(height: 10.h) ,
                          TextRow('trip_history_card_driver_vehicle_plate'.tr(), trip.driver.plateNumber),
                          SizedBox(height: 10.h) ,
                          TextRow('trip_history_card_start_time'.tr(), DateFormat('y-MM-dd').format(DateTime.parse(trip.startTime)))

                        ]
                    )
                )
            )
        )
    );


  }

  Row TextRow(String title, String subtitle){

    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
                title,
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
                  subtitle,
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
